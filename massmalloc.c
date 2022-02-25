#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv){
    

    int numAllocs;
    int allocSize;
    int i;
    char **ptrArray;

    if (argc != 3){
        printf("Usage: massmalloc [numAllocs] [allocSize]\n");
        printf("Error: Invalid number of arguments\n");
        exit(EXIT_FAILURE);
    }

    numAllocs = atoi(argv[1]);
    allocSize = atoi(argv[2]);
    printf("Allocating: %d pages of size %d\n", numAllocs, allocSize);
    ptrArray = (char**) malloc(numAllocs * sizeof(char*));
    for(i = 0; i < numAllocs; i++){
        ptrArray[i] = (char*) malloc(allocSize * sizeof(char));
    }

    for(i = 0; i < numAllocs; i++){
        free(ptrArray[i]);
    }

    free(ptrArray);
    return 0;
}