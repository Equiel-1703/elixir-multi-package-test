CPP_SOURCES := $(wildcard c_src/*.cpp)
OUT_DIR := priv

OUT_FILE := $(OUT_DIR)/backend_1_nifs.so

CXX := g++
CXX_FLAGS := -std=c++20 -Wall -Wextra -fpic -shared

.PHONY: all clean

all: $(OUT_FILE)

$(OUT_FILE): $(CPP_SOURCES) | $(OUT_DIR)
	$(CXX) $(CXX_FLAGS) -o $@ $^

$(OUT_DIR):
	mkdir -p $@

clean:
	rm -rf $(OUT_DIR)
