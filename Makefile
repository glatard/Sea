gcc_opts=-Wall -fPIC -c
debug_opts=-g -ggdb
all: passthrough.so
config.o: config.cpp
	gcc ${gcc_opts} ${debug_opts} config.cpp
passthrough.o: passthrough.cpp passthrough.h
	gcc ${gcc_opts} ${debug_opts} passthrough.cpp
sea.o: sea.cpp sea.h
	gcc ${gcc_opts} ${debug_opts} sea.cpp
functions.o: functions.cpp functions.h
	gcc ${gcc_opts} ${debug_opts} functions.cpp
logger.o: logger.cpp logger.h
	gcc ${gcc_opts} ${debug_opts} logger.cpp
passthrough.so: passthrough.o functions.o logger.o config.o sea.o
	gcc -shared passthrough.o functions.o logger.o config.o sea.o ${debug_opts} -o passthrough.so -ldl -lpthread -lstdc++ -liniparser
clean:
	\rm -f logger.o functions.o passthrough.o config.o sea.o passthrough.so *.gcda *.gcov *.gcno
