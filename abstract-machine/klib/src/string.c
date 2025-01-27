#include <klib.h>
#include <klib-macros.h>
#include <stdint.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

size_t strlen(const char *s) {
  if(s == NULL)
  {
	  printf("s is a nullptr, exit with return value 0\n");
	  return 0;
  }
  //panic("Not implemented");
  size_t i = 0;
  while(s[i] != '\0')
	  i++;
  return i;
}

char *strcpy(char *dst, const char *src) {
  //panic("Not implemented");
  size_t i;
  for(i = 0; src[i] != '\0'; i++)
	  dst[i] = src[i];
  dst[i] = '\0';
  return dst;
}

char *strncpy(char *dst, const char *src, size_t n) {
  //panic("Not implemented");
  if(dst == NULL || src == NULL || n <= 0)
  {
	  printf("unable to copy, exit with return value NULL\n");
	  return NULL;
  }
  size_t i;
  for(i = 0; i < n && src[i] != '\0'; i++)
	  dst[i] = src[i];
  for(; i < n; i++)
	  dst[i] = '\0';
  return dst;
}

char *strcat(char *dst, const char *src) {
  //panic("Not implemented");
  if(dst == NULL || src == NULL)
  {
	  printf("pointer dst or src is NULL, exit directly\n");
	  return NULL;
  }
  size_t i = 0;
  while(dst[i] != '\0')
	  i++;
  strcpy(dst + i, src);
  return dst;
}

int strcmp(const char *s1, const char *s2) {
  //panic("Not implemented");
  if(s1 == NULL || s2 == NULL)
  {
	  printf("unable to compare, exit with return value 0\n");
	  return 0;
  }
  size_t i = 0;
  while(s1[i] != '\0' && s2[i] != '\0')
  {
	  if(s1[i] > s2[i])
		  return 1;
	  if(s1[i] < s2[i])
		  return -1;
	  i++;
  }
  if(s1[i] != '\0' && s2[i] == '\0')
	  return 1;
  if(s1[i] == '\0' && s2[i] != '\0')
	  return -1;
  return 0;
}

int strncmp(const char *s1, const char *s2, size_t n) {
	if(s1 == NULL || s2 == NULL || n <= 0)
	{
		printf("unable to compare, exit with return value 0\n");
		return 0;
	}
	while(n--)
	{
		if(*s1 > *s2)
			return 1;
		if(*s1 < *s2)
			return -1;
		s1++;
		s2++;
	}
	return 0;
}

void *memset(void *s, int c, size_t n) {
  //panic("Not implemented");
  if(s == NULL || n <= 0)
	  return s;
  char *ch = (char *) s;
  while(n-- > 0)
	  *ch++ = c;
  return s;
}

void *memmove(void *dst, const void *src, size_t n) {
  //panic("Not implemented");
  // 考虑目的地址在源地址之前还是之后，存在重叠的情况
  if(dst == NULL || src == NULL || n <= 0)
  {
	  printf("unable to move, exit with return value null\n");
	  return NULL;
  }
  if(dst < src)
  {
	  char *d = (char *) dst;
	  char *s = (char *) src;
	  while(n--)
	  {
		  *d = *s;
		  d++;
		  s++;
	  }
  }
  else
  {
	  char *d = (char *) dst + n - 1;
	  char *s = (char *) src + n - 1;
	  while(n--)
	  {
		  *d = *s;
		  d--;
		  s--;
	  }
  }
  return dst;
}

void *memcpy(void *out, const void *in, size_t n) {
  //panic("Not implemented");
  if(out == NULL || in == NULL || n <= 0) 
  {
	  printf("unable to copy, exit with return value nullptr\n");
	  return NULL;
  }
  char *d = (char *) out;
  char *s = (char *) in;
  while(n--)
  {
	  *d = *s;
	  d++;
	  s++;
  }
  return out;
}

int memcmp(const void *s1, const void *s2, size_t n) {
  //panic("Not implemented");
  if(s1 == NULL || s2 == NULL || n <= 0)
  {
	  printf("unable to compare, exit with return value 0\n");
	  return 0;
  }
  char * S1 = (char *)s1;
  char * S2 = (char *)s2;
  while(n--)
  {
	  if(*S1 > *S2)
		  return 1;
	  if(*S1 < *S2)
		  return -1;
	  S1++;
	  S2++;
  }
  return 0;
}
/*
 * memcmp函数会一直比较直到出现不同的值或已经完成了n个字节的比较，即使n大于两个字符串的长度
 * strncmp函数也采用了类似的逻辑
 * strcmp函数会考虑两个字符串的结尾，
 */
#endif
