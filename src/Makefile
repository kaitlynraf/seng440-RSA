CC = gcc
CFLAGS = -Wall

TARGET = rsa
SRCS = mmm.c rsa.c lookup_table.c tests.c main.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

clean:
	rm -f $(OBJS) $(TARGET)