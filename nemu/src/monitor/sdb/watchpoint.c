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
  while (cur){
    if (cur->condation){
      *point = cur;
      IFDEF(CONFIG_DEBUG, Log("Break"));
      return true;
    }
    cur = cur->next;
  }
  return false;
}

//从free_链表中返回一个空闲的监视点结构
WP* new_wp(const char *condation, bool *success){
  if (free_->next == NULL){
    assert(0);
  }
  //返回free_的下一个监视点，free_->next指向下一个监视点
  WP* result = free_->next;
  result->NO = number++;
  free_->next = result->next;
  result->next = NULL;
  strcpy(result->condation, condation);
  
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
  printf("未找到 \e[1;36mWatchPoint(NO.%d)\e[0m\n", NO);
  return 0;
}

//遍历链表
void wp_display(){
  printf("NO.\tCondation\n");
  WP* cur = head;
  while (cur){
    printf("\e[1;36m%d\e[0m\t\e[0;32m%s\e[0m\n", cur->NO, cur->condation);
    cur = cur->next;
  }
}

//删除观察点
void delete_watchpoint(int no){
  if(free_wp(no)){
    printf("Watch point %d has been deleted.\n",no);
  }
}