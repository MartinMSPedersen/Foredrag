#include <cstdio>
#include <cstdlib>
#include <ctime>
int main() {
	srand(time(NULL));
	for (int i = 0; i < 16; ++i) {
		int src = rand(); 
		int dst = static_cast<int>((src * 1.0 / RAND_MAX) * 99);
		printf("%d ", dst);
	}
	printf("\n");
}
