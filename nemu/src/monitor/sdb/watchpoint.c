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

#include "sdb.h"

#define NR_WP 32

static WP wp_pool[NR_WP] = {};
static WP *head = NULL, *free_ = NULL;


//初始化 wp_pool head指向已分配的wp，free_指向未分配的wp
void init_wp_pool() {
  int i;
  for (i = 0; i < NR_WP; i ++) {
    wp_pool[i].NO = i;
    wp_pool[i].next = &wp_pool[i + 1];
  }
  wp_pool[NR_WP - 1].next = NULL;

  head = NULL;
  free_ = wp_pool;
}

static int number = 1;

bool check_watchpoint(WP **point){
  WP *cur = head;
  bool success = true;
  bool flag=false;
  while (cur){
    if (expr(cur->expression,&success) && expr(cur->expression,&success)!=cur->value){
      *point = cur;
      //IFDEF(CONFIG_DEBUG, Log("Break"));
      printf("%s changed, original value is %u,current value is %u\n",cur->expression,cur->value,expr(cur->expression,&success));
      cur->value=expr(cur->expression,&success);
      flag=true;
    }
    cur = cur->next;
  }
  if(flag){
    return true;
  }
  return false;
}

//从free_链表中返回一个空闲的监视点结构
WP* new_wp( const char *expression, bool *success){
  word_t val=expr(expression,success);
  //printf("%d\n",*success);
  if(!*success){
    printf("invalid watchpoint.\n");
    return NULL;
  }
  //所有可用的监视点都被分配
  if (free_->next == NULL){
    assert(0);
  }
  //返回free_的下一个监视点，free_->next指向下一个监视点
  WP* result = free_->next;
  result->NO = number++;
  free_->next = result->next;
  result->next = NULL;
  strcpy(result->expression, expression);
  result->value=val;
  
  //如果head为空，head指向res，否则将res插到队头
  if (head == NULL){
    head = result;
  }else{
    result->next = head->next;
    head->next = result;
  }

  return result;
}

//将释放的结点插到free_链表的头部
static void insert_free(WP *wp){
  wp->next = free_->next;
  free_->next = wp;
}

//将wp归还到free_链表中
int free_wp(int NO){
  if (head->NO == NO){
    //如果只有一个wp，释放head
    WP* buffer = head->next;
    insert_free(head);
    head = buffer;
    return 1;
  }
  //从链表中删除一个节点前，要保存前一个节点
  WP* prev = head;
  while (prev->next){
    if (prev->next->NO == NO){
      WP* buffer = prev->next->next;
      insert_free(prev->next);
      prev->next = buffer;
      return 1;
    }
    prev = prev->next;
  }
  //要删除的结点编号不存在
  printf("Can't find Watch Point(NO.%d) \n", NO);
  return 0;
}

//遍历链表
void wp_display(){
  printf("NO.\tCondation\n");
  WP* cur = head;
  while (cur){
    printf("\e[1;36m%d\e[0m\t\e[0;32m%s\e[0m\n", cur->NO, cur->expression);
    cur = cur->next;
  }
}

//删除观察点
void delete_watchpoint(int no){
  //在没有观察点时使用删除操作
  if(head==NULL){
    printf("Watch point has not been set!\n");
    return;
  }
  if(free_wp(no)){
    printf("Watch point %d has been deleted.\n",no);
  }
  return ;
}