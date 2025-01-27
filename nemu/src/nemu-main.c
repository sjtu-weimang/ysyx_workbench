/***************************************************************************************
* Copyright (c) 2014-2024 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <common.h>

void init_monitor(int, char *[]);
void am_init_monitor();
void engine_start();
int is_exit_status_bad();
word_t expr(char *e,bool *success);
void test_cmd_p();

int main(int argc, char *argv[]) {
  /* Initialize the monitor. */
#ifdef CONFIG_TARGET_AM
  am_init_monitor();
#else
  init_monitor(argc, argv);
#endif
  //test_cmd_p();
  /* Start engine. */
  engine_start();

  return is_exit_status_bad();
}
 void test_cmd_p(){
  int counter=0;
  char buffer[65535];
  char *expression;
  FILE *fp=fopen("./src/output.txt","r");
  assert(fp!=NULL);

  char* input=fgets(buffer,ARRLEN(buffer),fp);
    while(input!=NULL){
      input[strlen(input)-1]='\0';//将末尾的'\n'变成'\0'
      uint32_t ans=0;
      bool success=false;
      char* ans_text=strtok(input," ");
      sscanf(ans_text,"%u",&ans);
      expression=input+strlen(ans_text)+1;
      IFDEF(CONFIG_DEBUG,LOG("Testing %u %s .....\n",ans,expression));
      uint32_t result=expr(expression,&success);
      Assert(result==ans,"the result for expression %s is wrong",expression);
      input=fgets(buffer,ARRLEN(buffer),fp);
      ++counter;
    }
    Log("通过%d个测试用例",counter);
  
 }