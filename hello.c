#include <stdlib.h>
#include <stdio.h>
#include "world.h"

int main(int argc, char **argv) {
	const char *world = make_world();

	if(argc > 1)
		printf("Hello %s!", argv[1]);
	else
		printf("Hello %s!", world);

	return EXIT_SUCCESS;
}

