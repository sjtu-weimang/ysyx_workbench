BUILD_DIR = ./build
VSRC_DIR = ./vsrc
export PATH := $(PATH):$(abspath ./utils)

$(shell mkdir -p $(BUILD_DIR))

TOPNAME = top

#search for all .v files in the vsrc directory
VSRCS = $(wildcard $(VSRC_DIR)/*.v)
#path for generated exe files
BIN = $(abspath $(BUILD_DIR)/$(TOPNAME))

CSRCS += $(shell find $(abspath ./csrc) -name "*.c" -or -name "*.cc" -or -name "*.cpp")
CSRCS += $(abspath ./npc-main.c)

INC_PATH = $(abspath ./csrc/include)
CFLAGS += -I$(INC_PATH)

CFLAGS += $(shell llvm-config --cxxflags) -fPIE # llvm
CFLAGS := $(filter-out -D__STDC_FORMAT_MACROS, $(CFLAGS)) # lib verilator has define this macro

LDFLAGS += -lreadline $(shell llvm-config --libs) # llvm
LDFLAGS += -lSDL2 # sdl


$(BIN): $(VSRCS) $(CSRCS)
	verilator --build --public --exe -cc -O3 --x-assign unique --x-initial unique --noassert --timing --trace \
	-Wno-lint \
	--top-module $(TOPNAME) --Mdir $(BUILD_DIR)/obj_dir -o $@ \
	$(addprefix -CFLAGS , $(CFLAGS)) \
	$(addprefix -LDFLAGS , $(LDFLAGS)) \
	$^ \
	
.PHONY: all clean run

IMG ?= $(abspath ./img.bin)
ARGS ?= --diff=$(NEMU_HOME)/build/riscv64-nemu-interpreter-so

all: $(BIN)

clean:
	rm -rf $(BUILD_DIR)

run: all
	./build/top
