#include <am.h>
#include <klib-macros.h>
#include <klib.h>
#include <math.h>
#include <stdarg.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

#define HEX_LOWER "0123456789abcdef"
#define HEX_UPPER "0123456789ABCDEF"

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

typedef struct {
  bool alternate;    // #
  bool zero_pad;     // 0
  bool left_align;   // -
  bool space;        //
  bool sign;         // +
  int width;         // minimum field width
  int precision;     // precision
  bool is_long;      // l
  bool is_long_long; // ll
  char specifier;    // conversion specifier
} FormatFlags;

static void parse_flags(const char **fmt, FormatFlags *flags) {
  while (1) {
    switch (**fmt) {
    case '#':
      flags->alternate = true;
      break;
    case '0':
      flags->zero_pad = true;
      break;
    case '-':
      flags->left_align = true;
      break;
    case ' ':
      flags->space = true;
      break;
    case '+':
      flags->sign = true;
      break;
    default:
      return;
    }
    (*fmt)++;
  }
}

static int parse_number(const char **fmt, va_list *ap) {
  if (**fmt == '*') {
    (*fmt)++;
    return va_arg(*ap, int);
  }
  int num = 0;
  while (**fmt >= '0' && **fmt <= '9') {
    num = num * 10 + (**fmt - '0');
    (*fmt)++;
  }
  return num;
}

static void parse_format(const char **fmt, va_list *ap, FormatFlags *flags) {
  parse_flags(fmt, flags);

  // Parse width
  flags->width = parse_number(fmt, ap);

  // Parse precision
  if (**fmt == '.') {
    (*fmt)++;
    flags->precision = parse_number(fmt, ap);
  }

  // Parse length
  if (**fmt == 'l') {
    (*fmt)++;
    if (**fmt == 'l') {
      (*fmt)++;
      flags->is_long_long = true;
    } else {
      flags->is_long = true;
    }
  }

  flags->specifier = **fmt;
}

static int write_char(char *out, int n, int *j, char c) {
  if (*j < n - 1)
    out[(*j)++] = c;
  return 1;
}

static int write_num(char *out, int n, int *j, const char *buf, int len,
                     FormatFlags *flags) {
  int padding = flags->width > len ? flags->width - len : 0;
  int total = 0;
  char pad_char = flags->zero_pad && !flags->left_align ? '0' : ' ';

  // Left padding
  if (!flags->left_align) {
    while (padding-- > 0)
      total += write_char(out, n, j, pad_char);
  }

  // Number content
  for (int i = 0; i < len; i++)
    total += write_char(out, n, j, buf[i]);

  // Right padding
  if (flags->left_align) {
    while (padding-- > 0)
      total += write_char(out, n, j, ' ');
  }
  return total;
}

int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
  char buffer[32];
  int j = 0;
  FormatFlags flags;

  for (; *fmt && j < n; fmt++) {
    if (*fmt != '%') {
      write_char(out, n, &j, *fmt);
      continue;
    }

    fmt++; // Skip '%'
    if (*fmt == '%') {
      write_char(out, n, &j, '%');
      continue;
    }

    // Parse format specifier
    flags = (FormatFlags){0};
    parse_format(&fmt, &ap, &flags);

    switch (flags.specifier) {
    case 'n': {
      int *ptr = va_arg(ap, int *);
      *ptr = j;
      break;
    }
    case 's': {
      const char *s = va_arg(ap, const char *);
      int len = 0;
      while (s[len] && (flags.precision < 0 || len < flags.precision))
        len++;
      write_num(out, n, &j, s, len, &flags);
      break;
    }
    case 'c': {
      char c = (char)va_arg(ap, int);
      write_num(out, n, &j, &c, 1, &flags);
      break;
    }
    case 'd':
    case 'i': {
      long num = flags.is_long ? va_arg(ap, long) : va_arg(ap, int);
      int neg = num < 0;
      unsigned long unum = neg ? -num : num;

      int idx = 0;
      do {
        buffer[idx++] = '0' + (unum % 10);
        unum /= 10;
      } while (unum > 0);

      if (neg)
        buffer[idx++] = '-';
      else if (flags.sign)
        buffer[idx++] = '+';
      else if (flags.space)
        buffer[idx++] = ' ';

      // Reverse buffer
      for (int i = 0; i < idx / 2; i++) {
        char tmp = buffer[i];
        buffer[i] = buffer[idx - 1 - i];
        buffer[idx - 1 - i] = tmp;
      }
      write_num(out, n, &j, buffer, idx, &flags);
      break;
    }
    case 'x':
    case 'X': {
      const char *hex = (flags.specifier == 'X') ? HEX_UPPER : HEX_LOWER;
      unsigned long unum =
          flags.is_long ? va_arg(ap, unsigned long) : va_arg(ap, unsigned int);
      int idx = 0;

      if (flags.alternate) {
        write_char(out, n, &j, '0');
        write_char(out, n, &j, flags.specifier);
      }

      do {
        buffer[idx++] = hex[unum % 16];
        unum /= 16;
      } while (unum > 0);

      // Reverse buffer
      for (int i = 0; i < idx / 2; i++) {
        char tmp = buffer[i];
        buffer[i] = buffer[idx - 1 - i];
        buffer[idx - 1 - i] = tmp;
      }
      write_num(out, n, &j, buffer, idx, &flags);
      break;
    }
    case 'p': {
      uintptr_t ptr = (uintptr_t)va_arg(ap, void *);
      const char *hex = HEX_LOWER;
      int idx = 0;

      write_char(out, n, &j, '0');
      write_char(out, n, &j, 'x');

      do {
        buffer[idx++] = hex[ptr % 16];
        ptr /= 16;
      } while (ptr > 0);

      // Add leading zeros if needed
      while (idx < (int)sizeof(void *) * 2)
        buffer[idx++] = '0';

      // Reverse buffer
      for (int i = 0; i < idx / 2; i++) {
        char tmp = buffer[i];
        buffer[i] = buffer[idx - 1 - i];
        buffer[idx - 1 - i] = tmp;
      }
      write_num(out, n, &j, buffer, idx, &flags);
      break;
    }
    default:
      write_char(out, n, &j, '%');
      write_char(out, n, &j, flags.specifier);
    }
  }

  if (j < n)
    out[j] = '\0';
  else if (n > 0)
    out[n - 1] = '\0';

  return j;
}
#endif
