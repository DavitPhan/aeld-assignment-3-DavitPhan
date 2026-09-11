ifeq ($(CROSS_COMPILE),"aarch64-none-linux-gnu-")
    CC := $(CROSS_COMPILE)gcc
else
	CC := cc
endif

writer : writer.o
	$(CC) -o writer writer.o

writer.o : writer.c
	$(CC) -c writer.c
clean :
	rm -f writer.o writer