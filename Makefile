OBJS = search_reader.o message.pb.o
CC = g++
DEBUG = -g
CFLAGS = -std=c++0x -W -Wall -c $(DEBUG)
GCC_FLAGS = -W -Wall -c $(DEBUG)
LFLAGS = -W -Wall $(DEBUG)

search_reader: $(OBJS)
	$(CC) $(LFLAGS) $(OBJS) -lzmq -lpthread -ldl -L/usr/local/lib -lprotobuf -o search_reader
search_reader.o: search_reader.cpp
	$(CC) $(CFLAGS) search_reader.cpp
message.pb.o: message.pb.cpp
	$(CC) -c message.pb.cpp -o message.pb.o

clean:
	rm *.o search_reader