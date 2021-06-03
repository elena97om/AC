#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

//Si comento #pragma omp for, utiliza el mismo ID para las hebras y se pisan los valores
//Si comento el #pragma omp parallel, solo ejecuta una hebra(la master), porque quito el paralelismo

int main(int argc, char **argv) {
	
	int i, n;
	if(argc < 2) {
		fprintf(stderr,"\n[ERROR] - Falta no iteraciones \n");
		exit(-1);
	}
	n = atoi(argv[1]);
	
	#pragma omp parallel for
	{
		for (i=0; i<n; i++)
			printf("thread %d ejecuta la iteración %d del bucle\n", omp_get_thread_num(),i);
	}

	return(0);
}
