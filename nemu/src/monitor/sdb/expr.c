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

#include <isa.h>

/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <regex.h>

enum {
  TK_NOTYPE = 256,
  TK_EQ,
  TK_NUM,
  TK_PLUS,
  TK_MINUS,
  TK_MUL,
  TK_DIV,
  TK_LPAR,
  TK_RPAR,
  /* TODO: Add more token types */

};

static struct rule {
  const char *regex;
  int token_type;
} rules[] = {

  /* TODO: Add more rules.
   * Pay attention to the precedence level of different rules.
   */
  //用正则表达式匹配token
  {" +", TK_NOTYPE},    // 空格
  {"\\+", TK_PLUS},     // 加号
  {"-", TK_MINUS},      // 减号
  {"\\*", TK_MUL},      // 乘号
  {"/", TK_DIV},        // 除号
  {"==", TK_EQ},        // 等号
  {"[0-9]+", TK_NUM},   // 数字
  {"\\(", TK_LPAR},      // 左括号
  {"\\)", TK_RPAR},      // 右括号
};


#define NR_REGEX ARRLEN(rules)

static regex_t re[NR_REGEX] = {};

/* Rules are used for many times.
 * Therefore we compile them only once before any usage.
 */
void init_regex() {
  int i;
  char error_msg[128];
  int ret;

  for (i = 0; i < NR_REGEX; i ++) {
    ret = regcomp(&re[i], rules[i].regex, REG_EXTENDED);
    if (ret != 0) {
      regerror(ret, &re[i], error_msg, 128);
      panic("regex compilation failed: %s\n%s", error_msg, rules[i].regex);
    }
  }
}

typedef struct token {
  int type;
  char str[32];
} Token;

static Token tokens[32] __attribute__((used)) = {};
static int nr_token __attribute__((used))  = 0;

//根据token类型将其存储到tokens数组中
static bool make_token(char *e) {
  int position = 0;
  int i;
  regmatch_t pmatch;

  nr_token = 0;

  while (e[position] != '\0') {
    for (i = 0; i < NR_REGEX; i++) {
      if (regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
        int substr_len = pmatch.rm_eo;
        position += substr_len;

        if (rules[i].token_type == TK_NOTYPE)
          continue; // 忽略空格

        if (nr_token >= 32) {
          printf("Too many tokens.\n");
          return false;
        }

        tokens[nr_token].type = rules[i].token_type;
        strncpy(tokens[nr_token].str, e + position - substr_len, substr_len);
        tokens[nr_token].str[substr_len] = '\0';
        nr_token++;

        break;
      }
    }

    if (i == NR_REGEX) {
      printf("No match at position %d\n%s\n%*.s^\n", position, e, position, "");
      return false;
    }
  }

  return true;
}

//judge whether the token is an operator
bool is_operator(int type){
  return type == TK_PLUS || type == TK_MINUS || type == TK_MUL || type == TK_DIV;
}

//get the precedence of the operator
int get_precedence(int type){
  switch(type){
    case TK_PLUS:
    case TK_MINUS:
      return 1;
    case TK_MUL:
    case TK_DIV:
      return 2;
    default:
      return 0;
  }
}

// //使用将中缀表达式转换为后缀表达式的方法计算表达式的值
// word_t expr(char *e, bool *success) {
//   if (!make_token(e)) {
//     *success = false;
//     return 0;
//   }

//   Token postfix[32];
//   int postfix_len = 0;
//   int op_stack[32];
//   int op_top = 0;

//   //将中缀表达式转换为后缀表达式
//   for (int i = 0; i < nr_token; i++) {
//     Token token = tokens[i];

//     if (token.type == TK_NUM) {
//       postfix[postfix_len++] = token;
//     } else if (token.type == TK_LPAR) {
//       op_stack[op_top++] = token.type;
//     } else if (token.type == TK_RPAR) {
//       while (op_top > 0 && op_stack[op_top - 1] != TK_LPAR) {
//         postfix[postfix_len++] = (Token){op_stack[op_top - 1], ""};
//         op_top--;
//       }
//       if (op_top > 0 && op_stack[op_top - 1] == TK_LPAR)
//         op_top--;
//       else {
//         *success = false;
//         return 0;
//       }
//     } else if (is_operator(token.type)) {
//       while (op_top > 0 && op_stack[op_top - 1] != TK_LPAR && get_precedence(op_stack[op_top - 1]) >= get_precedence(token.type)) {
//         postfix[postfix_len++] = (Token){op_stack[op_top - 1], ""};
//         op_top--;
//       }
//       op_stack[op_top++] = token.type;
//     }
//   }

//   while (op_top > 0) {
//     if (op_stack[op_top - 1] == TK_LPAR || op_stack[op_top - 1] == TK_RPAR) {
//       *success = false;
//       return 0;
//     }
//     postfix[postfix_len++] = (Token){op_stack[op_top - 1], ""};
//     op_top--;
//   }

//   int value_stack[32];
//   int value_top = 0;

//   //计算后缀表达式的值
//   for (int i = 0; i < postfix_len; i++) {
//     Token token = postfix[i];

//     if (token.type == TK_NUM) {
//       int num = atoi(token.str);
//       value_stack[value_top++] = num;
//     } else if (is_operator(token.type)) {
//       if (value_top < 2) {
//         *success = false;
//         return 0;
//       }
//       int b = value_stack[--value_top];
//       int a = value_stack[--value_top];
//       int result;
//       switch (token.type) {
//         case TK_PLUS:
//           result = a + b;
//           break;
//         case TK_MINUS:
//           result = a - b;
//           break;
//         case TK_MUL:
//           result = a * b;
//           break;
//         case TK_DIV:
//           if (b == 0) {
//             *success = false;
//             return 0;
//           }
//           result = a / b;
//           break;
//         default:
//           *success = false;
//           return 0;
//       }
//       value_stack[value_top++] = result;
//     }
//   }

//   if (value_top != 1) {
//     *success = false;
//     return 0;
//   }

//   *success = true;
//   return value_stack[0];
// }



//检查表达式是否被一对匹配的括号包围
bool check_parenteses(int p,int q){
  if(tokens[p].type!='('||tokens[q].type!=')'){
    return false;
  }
  int balance=0;
  for(int i=p;i<=q;i++){
    if(tokens[i].type=='(')balance++;
    if(tokens[i].type==')')balance--;
    if(balance==0 && i!=q) return false;
  }
  return true;
}

// 查找主运算符的位置
int find_main_op(int p, int q) {
  int balance = 0;
  int main_op_pos = -1;
  int min_priority = 9999; // 优先级最低的运算符

  for (int i = p; i <= q; i++) {
    if (tokens[i].type == '(') balance++;
    if (tokens[i].type == ')') balance--;
    if (balance != 0) continue; // 忽略括号内的运算符

    int priority = 9999;
    switch (tokens[i].type) {
      case '+':
      case '-':
        priority = 1; // 加减法优先级最低
        break;
      case '*':
      case '/':
        priority = 2; // 乘除法优先级较高
        break;
    }

    if (priority <= min_priority) {
      min_priority = priority;
      main_op_pos = i;
    }
  }

  return main_op_pos;
}
//递归计算表达式的值
int eval(int p,int q){
  if(p>q){
    //无效表达式
    printf("Bad expresssion.\n");
    return 0;
  }else if(p==q){
    //单个token，必须是数字
    if(tokens[p].type==TK_NUM){
      int val=atoi(tokens[p].str);
      return val;
    }else{
      printf("Expected a number,but got: %s\n",tokens[p].str);
      return 0;
    }
  }else if(check_parenteses(p,q)){
    //递归计算去掉括号后的表达式
    return eval(p+1,q-1);
  }else{
    //查找主运算符
    int op_pos=find_main_op(p,q);
    if(op_pos==-1){
      printf("No main operator found.\n");
      return 0;
    }

    int val1=eval(p,op_pos-1);
    int val2=eval(op_pos+1,q);

    switch(tokens[op_pos].type){
      case '+':return val1+val2;break;
      case '-':return val1-val2;break;
      case '*':return val1*val2;break;
      case '/':
        if(val2==0){
          printf("Division by zero.\n");
          return 0;
        }
        return val1/val2;
      default:
        printf("Unknown operator: %s\n",tokens[op_pos].str);
        return 0;
    }
  }

}

//使用递归的方式计算表达式的值
word_t expr(char *e, bool *success){
    if (!make_token(e)) {
    *success = false;
    return 0;
  }
  int p=0,q=nr_token;
  return eval(p,q);
}