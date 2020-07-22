library(foreach)
library(doParallel)
library(snow)

# Sample function to beenchmark performance
iterative_sum <- function(n){
  result <- 0
  for (i in 1:n){
    result <- result + i
  }
  return(result)
}

# we create a cluster (a group of R processes): make 4 of them, their communication type is "SOCK" (compatible with both Windows and Linux, probably MacOS too - don't worry about it). Bonus: skip loading the `methods` package for some extra speed - that's what the third argument is for :)
parallelCluster <- makeCluster(7, 
                               type = "SOCK", 
                               methods = FALSE)

# Everything inside clusterEvalQ will be run on each cluster
# It is good to preprocess things
clusterEvalQ(cl = parallelCluster , {
  x <- 2 + 2
})

# ClusterCall is similar to clusterEvalQ, the main difference is that clusterCall copies all local variables to each cluster!
clusterCall(cl = parallelCluster, function () { }) # do nothing

# tell R that we want to use these processes to do calculations
setDefaultCluster(parallelCluster)
registerDoParallel(parallelCluster)

inputs <- seq(10e6, 10e6+13)

start_time_parallel <- Sys.time()
results_parallel <- foreach(currentValue = inputs, .combine = c) %dopar% {
  iterative_sum(currentValue) # the last value in this block will be the result of the calculation!
}
end_time_parallel <- Sys.time()

start_time_sequential <- Sys.time()
results_sequential <- sapply(inputs, iterative_sum)
end_time_sequential <- Sys.time()

# tell R that we don't need the processes anymore
stopCluster(parallelCluster)

# 4.37 speedup using 7 cores
print(paste0("Computation time parallel: ", end_time_parallel - start_time_parallel))
print(paste0("Computation time sequential: ", end_time_sequential - start_time_sequential))