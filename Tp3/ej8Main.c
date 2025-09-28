#include <stdio.h>

#include<stddef.h>  //size_t
#define readFd_ONLY 0
#define BUFFER_SIZE 1024
#define STDOUT 1
#define PATH "./textoEj8.txt"

void exit(int error_code);
unsigned int readFd(int fd, void *buf, unsigned int count);
unsigned int writeFd(int fd, void *buf, unsigned int count);
int openFile(const char *pathname, int flags);
int close(int fd);

void print_line_count(int line_count, char * buf);



int main() {
    char buffer[BUFFER_SIZE];
    int fd;
    unsigned int bytes_readFd;
    int line_count = 1;
    char line_count_buf[14];
    line_count_buf[0] = ' ';
    line_count_buf[1] = '[';

    // abrimos el archivo de texto.
    fd = openFile(PATH, readFd_ONLY);
    if (fd < 0) {
        char error_msg[] = "Error openFileing file\n";
        writeFd(STDOUT, error_msg, sizeof(error_msg) - 1);
        exit(1);
    }

    // por si no entra en el buff, leemos varias veces
    while (bytes_readFd = readFd(fd, buffer, BUFFER_SIZE)) {
        // hacemos una sliding window
        int i = 0;
        while (i < bytes_readFd) {
            int j = i;
            while (j < bytes_readFd && buffer[j] != '\n') {
                j++;
            }
            writeFd(STDOUT, buffer+i, j-i);
            
            // ya esta escrita la linea, ahora a escribir el numero
            // chequeamos que sea un enter y no que se termino el buffer
            if (j < bytes_readFd && buffer[j] == '\n') {
                print_line_count(line_count++, line_count_buf);
            }
            

            i = j+1;
        }
    }

    print_line_count(line_count, line_count_buf);

    // cerramos el ARCHIVO y nos vamos
    close(fd);
    return 0;
    
    
}

void print_line_count(int line_count, char * buf) {
    int temp = line_count;
    int digits = 1;
    while ((temp /= 10) > 0) {
        digits++;
    }
    temp = line_count;
    for (int k = digits-1; k >= 0; k-- ) {
        buf[2+k] = '0' + (temp % 10);
        temp /= 10;
    }
    buf[digits+2] = ']'; // offset de 2 por ' ' y '['
    buf[digits+3] = '\n';

    writeFd(STDOUT, buf, digits+4); // digitos + ' ', [, ]
}