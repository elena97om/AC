#! / bin / bash
# Órdenes para el sistema de colas:
# 1. Asigna al trabajo un nombre
# SBATCH --nombre-trabajo = holaOMP
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

#para N potencia de 2 desde 2^16 a 2^26

echo ""
echo "SUMAVECTORES FOR: "
echo ""

for ((N=16384;N<67108865;N=N*2))
do
	 ./sp-OpenMP-for $N >> datosFOR.txt
done

echo ""
echo "SUMAVECTORES SECTIONS: "
echo ""

for ((N=16384;N<67108865;N=N*2))
do
	./sp-OpenMP-sections $N >> datosSECTIONS.txt
done

echo ""
echo "SUMAVECTORES SECUENCIAL: "
echo ""

for ((N=16384;N<67108865;N=N*2))
do
	./SumaVectoresC $N >> datosSECUENCIAL.txt
done
