#!/bin/env python3

import argparse

# physical cores per node
PCORES_NODE = 32
# hyperthreads
HYPERTHREADS = 1

# logical CPUs per node
LCPUS_NODE = PCORES_NODE * HYPERTHREADS

parser = argparse.ArgumentParser(description='Calculate SLURM configurations')
parser.add_argument('nodes', metavar='N', type=int, help='Number of nodes')

def main():
    args = parser.parse_args()
    nodes = args.nodes
    lcpus = nodes * LCPUS_NODE

    print('Nodes: {}'.format(nodes))
    print('Physical cores: {}'.format(nodes * PCORES_NODE))
    print('Logical CPUs: {}'.format(lcpus))
    
    # start with # MPI tasks = # logical CPUs
    mpi = lcpus
    scenario = 1
    while mpi >= nodes:
        lcpus_mpi = lcpus // mpi
        ompthreads = lcpus_mpi // HYPERTHREADS
        if ompthreads < 1: ompthreads = 1
        if ompthreads > 8:
            break
        print('='*20)
        print('Scenario {}'.format(scenario))
        print('  MPI tasks (-n,--ntasks): {}'.format(mpi))
        print('  MPI tasks per node (--ntasks-per-node): {}'.format(mpi//nodes))
        print('  Logical CPUs per MPI task (-c,--cpus-per-task): {}'.format(lcpus_mpi))
        print('  OpenMP threads (OMP_NUM_THREADS): {}'.format(ompthreads))
        scenario += 1
        mpi = mpi // 2
            

if __name__=='__main__':
    main()