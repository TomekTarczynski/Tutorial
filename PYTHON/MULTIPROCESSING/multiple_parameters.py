# Example of how to run multiple processes where each process run a functions with multiple arguments.
# Arguments have to be passed as list of tuples
# Returned values are stored

import multiprocessing
from os import getpid

def worker(procnum, max_range):
    result = 0
    for i in range(max_range):
        result = result + i
    print('I am number %d in process %d' % (procnum, getpid()))
    return (getpid(), result)

if __name__ == '__main__':
    pool = multiprocessing.Pool(processes = 3)
    params = list(zip(range(5), range(10000000, 10000005)))
    result = pool.starmap(worker, params)
    print(result)
