# Compiler
CXX = g++

# Paths to SFML
INCLUDE = -I./lib/sfml/include
LIBDIR = -L./lib/sfml/lib

LIBS = -lsfml-graphics -lsfml-window -lsfml-system


# SFML Libraries to link against
LIBS = -lsfml-graphics -lsfml-window -lsfml-system

# Source files
SRC = main.cpp

# Output directory and target
TARGET_DIR = build
TARGET = $(TARGET_DIR)/sfml

# Rule to build the project
$(TARGET): $(SRC)
	@mkdir -p $(TARGET_DIR)
	$(CXX) $(SRC) -o $(TARGET) $(INCLUDE) $(LIBDIR) $(LIBS)
	

dev: $(TARGET)
	LD_LIBRARY_PATH=./lib/sfml/lib ./$(TARGET)

install-deps:
	mkdir -p lib 
	curl https://www.sfml-dev.org/files/SFML-2.6.1-linux-gcc-64-bit.tar.gz | tar -zx -C lib
	mv SFML-2.6.1 sfml

.PHONY: install-deps

# Clean rule
clean:
	rm -rf $(TARGET_DIR)

.PHONY: clean
