#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TAM_S 5000
#define TAM_R 40000

struct{
	int a;
	int b;
} s[TAM_S];

int R[TAM_R];

int main(){
	int i, ii, X1, X2;

	struct timespec cgt1, cgt2;			//Medicion de tiempo
	double ncgt;

	for (i = 0; i < TAM_S; i++ ) {
		s[i].a = i;
		s[i].b = 2*i;
	}


	clock_gettime(CLOCK_REALTIME,&cgt1);

	for ( ii = 0; ii < TAM_R; ii++ ) {
		X1 = 0;
		X2 = 0;

		for(i=0; i < TAM_S; i++) X1+=2*s[i].a+ii;
		for(i=0; i < TAM_S; i++) X2+=3*s[i].b-ii;

		if ( X1 < X2 )  R[ii] = X1;  else  R[ii] = X2;
	}

	clock_gettime(CLOCK_REALTIME,&cgt2);

	ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec) / (1.e+9));


	printf("\nVector R: \n");
	printf("R[0]=%d R[39999]=%d\n", R[0], R[TAM_R-1]);
	printf("Tiempo: %11.9f\n", ncgt);

	return 0;
}
