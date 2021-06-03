#include <stdlib.h>
#include <stdio.h>
#include <omp.h>
#include <string.h>

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

  if (vector == NULL || result == NULL || matriz == NULL){
    perror("Error en la asignación de memoria");
    return EXIT_FAILURE;
  }

	for (int i = 0; i < N; i++){
		if ((matriz[i] = (double*) malloc(N*sizeof(double))) == NULL){
      perror("Error en la asignación de memoria para la matriz");
      return EXIT_FAILURE;
    }
	}

  for (i = 0; i < N; i++){
    matriz[i] = (double*) malloc(N*sizeof(double));
  }

  for (i = 0; i < N; i++){
    for(j = 0; j < N; j++)
      matriz[i][j] = 3.0;
    vector[i] = 5.0;
    result[i] = 0.0;
  }

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

  for (i = 0; i < N; i++){
    for (j = 0; j < N; j++)
      result[i] += matriz[i][j] * vector[j];
  }

  result[N-1] = matriz[N-1][N-1] * vector[N-1];

  printf("Resultado:\n");
  for (i = 0; i < N; i++)
    printf("%5.2f ", result[i]);
  printf("\n");

	for (int i = 0; i < N; ++i){
		free(matriz[i]);
	}

	free(matriz);
	free(vector);
	free(result);

	return EXIT_SUCCESS;
}
