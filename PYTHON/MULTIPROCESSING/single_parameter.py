# Example of how to run multiple processes where each process run a functions with single argument.
# Returned values are stored

import multiprocessing
from os import getpid

def worker(procnum):
    result = 0
    for i in range(10000000 + getpid()):
        result = result + i
    print('I am number %d in process %d' % (procnum, getpid()))
    return (getpid(), result)

if __name__ == '__main__':
    pool = multiprocessing.Pool(processes = 3)
    result = pool.map(worker, range(5))
    print(result)
