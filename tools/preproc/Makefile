CXX = g++

CXXFLAGS = -Wall -Werror -std=c++11 -O2

.PHONY: clean

preproc: preproc.cpp
	$(CXX) $(CXXFLAGS) preproc.cpp -o $@ $(LDFLAGS)

clean:
	$(RM) preproc preproc.exe
