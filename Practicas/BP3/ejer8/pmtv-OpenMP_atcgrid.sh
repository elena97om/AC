#!/bin/bash

#Órdenes para el sistema de colas
#SBATCH --job-name=pmtv-OpenMP_atcgrid   # Asigna un nombe al trabajo
#SBATCH --partition=ac        # Asigna una cola (partición)
#SBATCH --account=ac          # Asigna un account
#SBATCH --ntasks=1            # Procesos por nodo
#SBATCH --cpus-per-task=12    # Número de hebras por proceso
#SBATCH --hint=nomultithread  # Solo una hebra por core físico
#SBATCH --exclusive           # No se comparte el cluster con otros trabajos de la cola
#SBATCH --output=pmtv-OpenMP_atcgrid.log # Nombre del fichero de salida

#Obtención de información de las variables del entorno del sistema de colas:
echo "# Id. usuario del trabajo: $SLURM_JOB_USER"
echo "# Id. del trabajo: $SLURM_JOBID"
echo "# Nombre del trabajo especificado por usuario: $SLURM_JOB_NAME"
echo "# Directorio de trabajo (en el que se ejecuta el script): $SLURM_SUBMIT_DIR"
echo "# Cola: $SLURM_JOB_PARTITION"
echo "# Nodo que ejecuta este trabajo: $SLURM_SUBMIT_HOST"
echo "# Nº de nodos asignados al trabajo: $SLURM_JOB_NUM_NODES"
echo "# Nodos asignados al trabajo: $SLURM_JOB_NODELIST"
echo "# CPUs por nodo: $SLURM_JOB_CPUS_PER_NODE"

#Instrucciones del script para ejecutar código:
export OMP_NUM_THREADS=12
export OMP_SCHEDULE="static"
echo "static y chunk por defecto"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="static,1"
echo "static y chunk 1"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="static,64"
echo "static y chunk 64"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic"
echo "dynamic y chunk por defecto"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,1"
echo "dynamic y chunk 1"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="dynamic,64"
echo "dynamic y chunk 64"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="guided"
echo "guided y chunk por defecto"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,1"
echo "guided y chunk 1"
srun ./pmtv-OpenMP 15360

export OMP_SCHEDULE="guided,64"
echo "guided y chunk 64"
srun ./pmtv-OpenMP 15360
