#include <stdio.h>

#ifdef _OPENMP
	#include <omp.h>
#else
	#define omp_get_thread_num() 0
#endif

int main()
{
	int i, n = 7;
	int a[n], suma;

	for (i=0; i<n; i++)
		a[i] = i;

	#pragma omp parallel private(suma)
	{
		suma = 2;
		#pragma omp for
		for (i=0; i<n; i++)
		{
			suma = suma + a[i];
		}
	}

	printf("\n suma fuera del parallel:");
	for (i=0; i<n; i++) {
		printf("thread %d suma a[%d] / ", omp_get_thread_num(), i);
	}
	printf("\n* thread %d suma= %d", suma);

	printf("\n");
}
