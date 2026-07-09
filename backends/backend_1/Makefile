CPP_SOURCES := $(wildcard c_src/*.cpp)
OUT_DIR := priv
OUT_FILE := $(OUT_DIR)/backend_1_nifs.so

CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -fpic -shared

$(OUT_FILE): $(CPP_SOURCES)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OUT_DIR):
	mkdir -p $@

all: $(OUT_DIR) $(OUT_FILE)

clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean