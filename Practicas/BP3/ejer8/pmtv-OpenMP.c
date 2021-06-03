#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
    #include <omp.h>
#endif
#include <string.h>

#define FINAL

int main ( int argc, char **argv ){
  if (argc < 2){
    perror("Falta tamaño de la matriz\n");
    return EXIT_FAILURE;
	}

	unsigned int N = atoi(argv[1]);

  if(N == 0){
    perror("Tamaño invalido");
    return EXIT_FAILURE;
  }

	double *vector, *result, **matriz;
	vector = (double *) malloc(N*sizeof(double));
	result = (double *) malloc(N*sizeof(double));
	matriz = (double **) malloc(N*sizeof(double*));
  int i, j;

  matriz = (double **) malloc(N*sizeof(double*));
  vector = (double *) malloc(N*sizeof(double));
  result = (double *) malloc(N*sizeof(double));
  for (i=0; i<N; i++)
      matriz[i] = (double*) malloc(N*sizeof(double));

  for (i=0; i<N; i++) {
    for (j=i; j<N; j++)
      matriz[i][j] = 3;
    vector[i] = 5;
    result[i] = 0;
  }

  #ifdef TESTING
  printf("Matriz:\n");
  for (i=0; i<N; i++) {
      for (j=0; j<N; j++){
          if (j >= i)
              printf("%5.2f ", matriz[i][j]);
          else
              printf("0 ");
      }
      printf("\n");
  }

    printf("vector:\n");
    for (i=0; i<N; i++)
        printf("%5.2f ", vector[i]);
    printf("\n");
    #endif

    double start, end, tiempo;
    start = omp_get_wtime();

    #pragma omp parallel for private(j) schedule(runtime)
    for (i=0; i<N; i++)
        for (j=i; j<N; j++)
            result[i] += matriz[i][j] * vector[j];

    result[N-1] = matriz[N-1][N-1] * vector[N-1];
    end = omp_get_wtime();
    tiempo = end - start;

    printf("Matriz:\n");
    for (i = 0; i < N; i++){
      for (j = 0; j < N; j++){
        if (j >= i)
          printf("%5.2f ", matriz[i][j]);
        else
          printf("0 ");
      }
      printf("\n");
    }

    printf("vector:\n");
    for (i = 0; i < N; i++)
      printf("%5.2f ", vector[i]);
    printf("\n");

    printf("Resultado:\n");
    for (i=0; i<N; i++)
        printf("%5.2f ", result[i]);
    printf("\n");


    #ifdef FINAL
    printf("Tiempo = %11.9f\t Primera = %5.2f\t Ultima=%5.2f\n",
    tiempo,result[0],result[N-1]);
    #endif


	for (int i = 0; i < N; ++i){
		free(matriz[i]);
	}

	free(matriz);
	free(vector);
	free(result);

	return EXIT_SUCCESS;
}
