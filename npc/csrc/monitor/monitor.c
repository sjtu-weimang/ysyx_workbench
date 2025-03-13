#include <getopt.h>
#include <stdlib.h>
#include <verilated.h>
#include <stdio.h>
#include <cpu/cpu.h>
#include <mem/paddr.h>

void init_sdb();
void init_disasm(const char *trible);
void init_log(const char* log_file);
void parse_elf_files(const char **elf_files,int elf_file_count);
void init_difftest(char* ref_so_file,long img_size);
void init_device();
void sdb_set_batch_mode();

//global variable used only in this file.
static char* img_file;
static char* log_file;
static int elf_file_count = 0;
static const char* elf_files[2];
static char* diff_so_file;

static void show_usage(char* name){
    printf("Usage:%s[OPTION...] IMAGE [args]\n\n",name);
    printf("\t-h,--help               help menu\n");
    printf("\t-b,--batch              run with batch mode\n");
    printf("\t-l,--log=FILE           output log to FILE\n");
    printf("\t-e,--elf=FILE           output func-calls to \"FILE.log\" file using FILE\n");
    printf("\t-d,--diff=REF_SO        run DiffTest with reference REF_SO\n");
    printf("\n");
    exit(1);
}

static void parse_args(int argc,char *argv[]){
  const option table[] = {
      {"batch", no_argument, 0, 'b'},      {"help", no_argument, 0, 'h'},
      {"log", required_argument, 0, 'l'},  {"elf", required_argument, 0, 'e'},
      {"diff", required_argument, 0, 'd'},
  };

  int o;
  while ((o = getopt_long(argc, argv, "-hbl:e:d:", table, NULL)) != -1) {
    switch (o) {
    case 'b':
      sdb_set_batch_mode();
      break;
    case 'l':
      log_file = optarg;
      break;
    case 'e':
      elf_files[elf_file_count++] == optarg;
      break;
    case 'd':
      diff_so_file = optarg;
      break;
    case 1:
      img_file = optarg;
      break;
    default:
      show_usage(argv[0]);
      break;
    }
  }

  if(img_file==NULL){
    show_usage(argv[0]);
  }
}

void init_monitor(int argc,char* argv[]){
  //verilator
  Verilated::commandArgs(argc,argv);

  // Verilated::traceEverOn(true);

  parse_args(argc,argv);

  init_sdb();

  init_disasm("riscv64-pc-linux-gun");

  init_log(log_file);

  int img_size = load_img(img_file);

  IFDEF(CONFIG_DIFFTEST,init_difftest(diff_so_file,img_size));

  // device
  // init_device();

  // img elf
  // parse_elf_files(elf_files,elf_file_count);
}