#!/bin/bash
# Órdenes para el sistema de colas:
# 1. Asigna al trabajo un nombre
# SBATCH --nombre-trabajo = ATCGRID4
# 2. Asignar el trabajo a una cola (partición)
# SBATCH --partición = ac
# 2. Asignar el trabajo a un account
# SBATCH --cuenta = ac

# Obtener información de las variables del entorno del sistema de colas:
echo  " Id. usuario del trabajo: $ SLURM_JOB_USER "
echo  " Id. del trabajo: $ SLURM_JOBID "
echo  " Nombre del trabajo especificado por usuario: $ SLURM_JOB_NAME "
echo  " Directorio de trabajo (en el que se ejecuta el script):
$ SLURM_SUBMIT_DIR "
echo  " Cola: $ SLURM_JOB_PARTITION "
echo  " Nodo que ejecuta este trabajo: $ SLURM_SUBMIT_HOST "
echo  " No de nodos asignados al trabajo: $ SLURM_JOB_NUM_NODES "
echo  " Nodos asignados al trabajo: $ SLURM_JOB_NODELIST "
echo  " CPU por nodo: $ SLURM_JOB_CPUS_PER_NODE "

for((i=1; i<=32;i=i+1))
do
  OMP_NUM_THREADS=$i
  export OMP_NUM_THREADS
  srun -p ac4 ./$1 7000 >> datosATCGRID47000
done

for((i=1; i<=32;i=i+1))
do
  OMP_NUM_THREADS=$i
  export OMP_NUM_THREADS
  srun -p ac4 ./$1 20000 >> datosATCGRID420000
done
