CC=gcc
CXX=g++
LIB=libege.dll liblua53.dll
INC=-I./include -I.
TARGET=-o ege4lua.exe
AUTORUN=-o autorun.exe -mwindows

all:ege4lua.o lua.o autorun.o luac.o
	$(CXX) $(TARGET) ege4lua.o lua.o $(LIB)
	$(CXX) $(AUTORUN) ege4lua.o autorun.o $(LIB)
	$(CXX) -o luac.exe luac.o liblua53.dll

ege4lua.o:ege4lua.cpp ege4lua.h
	$(CXX) -c ege4lua.cpp -W -Wall $(INC)

lua.o:lua.c toregister.h
	$(CXX) -c lua.c -W -Wall $(INC)

luac.o:luac.c
	$(CXX) -c luac.c -W -Wall $(INC)

autorun.o:autorun.cpp toregister.h
	$(CXX) -c autorun.cpp -W -Wall $(INC)

clean:
	del ege4lua.o lua.o luac.o autorun.o