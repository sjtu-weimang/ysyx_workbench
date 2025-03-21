#include <am.h>
#include <klib-macros.h>
#include <klib.h>
#include <math.h>
#include <stdarg.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

static char HEX[] = "0123456789ABCDEF";
// 使用va_list处理可变长度参数
int printf(const char *fmt, ...) {
  char buffer[2048];
  va_list arg;
  va_start(arg, fmt);
  int ret = vsprintf(buffer, fmt, arg);
  putstr(buffer);
  va_end(arg);
  return ret;
}

int vsprintf(char *out, const char *fmt, va_list ap) {
  // panic("Not implemented");
  return vsnprintf(out, -1, fmt, ap);
}

int sprintf(char *out, const char *fmt, ...) {
  // panic("Not implemented");
  va_list arg;
  va_start(arg, fmt);
  int ret = vsprintf(out, fmt, arg);
  va_end(arg);
  return ret;
}

int snprintf(char *out, size_t n, const char *fmt, ...) {
  // panic("Not implemented");
  va_list arg;
  va_start(arg, fmt);
  int ret = vsnprintf(out, n, fmt, arg);
  va_end(arg);
  return ret;
}

// 实现%0n类型的功能
int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
  // panic("Not implemented");
  char buffer[128];
  char *txt, cha; // 字符串类型和字符类型
  int num, len;
  unsigned int unum; // 无符号整数
  uint32_t pointer;  // 指针
  int state = 0, i, j;
  // bool fillFlag = false; // 补齐标志
  // int fillSize = 0; // 对齐位数
  for (i = 0, j = 0; fmt[i] != '\0'; i++) {
    switch (state) {
    case 0: // 正常复制
      if (fmt[i] != '%') {
        out[j] = fmt[i];
        j++;
      } else // 检测到%时进入类型匹配的阶段
        state = 1;
      break;
    case 1: // 类型匹配
      switch (fmt[i]) {
      case '0': // 需要进行补齐
        // fillFlag = true;
        break;
      case '2':
      case '4':
      case '8':
        // fillFlag = fmt[i] - '0';
        break;
      case 's':
        txt = va_arg(ap, char *);
        for (int k = 0; txt[k] != '\0'; k++) {
          out[j] = txt[k];
          j++;
        }
        break;
      case 'd':
        num = va_arg(ap, int);
        if (num == 0) {
          out[j] = '0';
          j++;
          break;
        }
        if (num < 0) {
          out[j] = '-';
          j++;
          num = -num;
        }
        for (len = 0; num; num /= 10, len++)
          buffer[len] = HEX[num % 10];
        for (int k = len - 1; k >= 0; k--) {
          out[j] = buffer[k];
          j++;
        }
        break;
      case 'c':
        cha = (char)va_arg(ap, int);
        out[j] = cha;
        j++;
        break;
      case 'p':
        pointer = va_arg(ap, uint32_t);
        for (len = 0; pointer; pointer /= 16, len++)
          buffer[len] = HEX[pointer % 16];
        for (int k = 0; k < 8 - len; k++) {
          out[j] = '0';
          j++;
        }
        for (int k = len - 1; k >= 0; k--) {
          out[j] = buffer[k];
          j++;
        }
        break;
      case 'x':
        unum = va_arg(ap, unsigned int);
        if (unum == 0) {
          out[j] = '0';
          j++;
          break;
        }
        for (len = 0; unum; unum >>= 4, len++)
          buffer[len] = HEX[unum & 0xF];
        for (int k = len - 1; k >= 0; k--) {
          out[j] = buffer[k];
          j++;
        }
        break;
      case 'u':
        unum = va_arg(ap, unsigned int);
        if (unum == 0) {
          out[j] = '0';
          j++;
          break;
        }
        for (len = 0; unum; unum /= 10, len++)
          buffer[len] = HEX[unum % 10];
        for (int k = len - 1; k >= 0; k--) {
          out[j] = buffer[k];
          j++;
        }
        break;
      default:
        // printf("%s\n", state);
        assert(0);
      }
      state = 0;
      break;
    }
  }
  out[j] = '\0';
  return j;
}

#endif
