#include <stdio.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[]){

    openlog(NULL,0, LOG_USER);

    if (argc != 3){
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
    }
    FILE *filePtr = fopen(argv[1],"w");

    if  (!filePtr){
        syslog(LOG_ERR, "Unable to create file in the directory: %s", argv[1]);
        return 1;
    }

    size_t result = fwrite(argv[2],strlen(argv[2]),1, filePtr);

    fclose(filePtr);

    syslog(LOG_DEBUG, "writing %s to %s", argv[2], argv[1]);

    closelog();

    return 0;
}