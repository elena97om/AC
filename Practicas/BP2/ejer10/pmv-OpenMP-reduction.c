#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <malloc.h>
#include <omp.h>

// Comentar uno
//#define GLOBAL
#define DINAMIC

#ifdef GLOBAL
	#define MAX 33554432
#endif

int main(int argc, char const *argv[]){
	if(argc != 2){
        printf("Error de argumentos %s", argv[0]);
        return(EXIT_FAILURE);
    }

    double cgt1, cgt2;
    double ncgt;

    int N = atoi(argv[1]);

    #ifdef GLOBAL
    	if(N > MAX) N = MAX;
        int matriz[N][N];
        int vector[N];
        int vector_resultado[N];
        printf("Ejecutado GLOBALMENTE\n");
    #endif

    #ifdef DINAMIC
        int **matriz, *vector, *vector_resultado;
        matriz = (int**) malloc(N * sizeof(int*));
        for(int i = 0; i < N; ++i)
            matriz[i] = (int*) malloc(N * sizeof(int));

        vector = (int*) malloc(N * sizeof(int));
        vector_resultado = (int*) malloc(N * sizeof(int));
        printf("Ejecutado DINAMICAMENTE\n");
    #endif

    #pragma omp parallel for
    for(int i = 0; i < N; ++i){
    	vector[i] = i;
    	#pragma omp parallel for
        for(int j = 0; j < N; ++j)
        	matriz[i][j] = i + j;
	}

	cgt1 = omp_get_wtime();
	//Calculamos el vector resultado
	for(int i = 0; i < N; i++){
		int suma = 0;
		#pragma omp parallel for reduction(+:suma)
		for(int j = 0; j < N; j++)
			suma += matriz[i][j] * vector[j];

		vector_resultado[i] = suma;
	}

	cgt2 = omp_get_wtime();
	ncgt = cgt2-cgt1;

	printf("Tiempo(seg.): %11.9f\t / Tamaño vectores: %u\n", ncgt, N);
	if(N < 11)
		for(int i = 0; i < N; i++){
			printf("VECTOR_RESULTADO[%d] = %d  ", i, vector_resultado[i]);
			printf("\n");
		}
	else{
		printf("VECTOR_RESULTADO[0] = %d  ", vector_resultado[0]);
		printf("VECTOR_RESULTADO[%d] = %d  ", N - 1, vector_resultado[N - 1]);
		printf("\n");
	}

	#ifdef DINAMIC
	for(int i = 0; i < N; i++)
		free(matriz[i]);

	free(matriz); free(vector); free(vector_resultado);
	#endif

    return 0;
}
