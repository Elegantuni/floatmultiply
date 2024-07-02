all:
	gcc -c -o floatmultiply1.o main.c
	gcc -o floatmultiply1 main.s floatmultiply1.o -static

clean:
	rm -f floatmultiply1 floatmultiply1.o


