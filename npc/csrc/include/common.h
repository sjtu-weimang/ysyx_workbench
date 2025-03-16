
#include <assert.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <conf.h>
#include <debug.h>
#include <macro.h>

#define CONFIG_RV64 0

typedef MUXDEF(CONFIG_RV64, long long unsigned int, unsigned int) word_t;
typedef MUXDEF(CONFIG_RV64, long long int, int) sword_t;
#define FMT_WORD MUXDEF(CONFIG_RV64, "0x%016llx", "0x%08x")

typedef MUXDEF(CONFIG_RV64, unsigned long long, unsigned int) paddr_t;
#define FMT_PADDR MUXDEF(CONFIG_RV64, "0x%016llx", "0x%08x")

extern int device_access_st;