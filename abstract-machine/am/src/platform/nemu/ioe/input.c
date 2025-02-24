#include <am.h>
#include <nemu.h>

#define KEYDOWN_MASK 0x8000

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
  // kbd->keydown = 0;
  // kbd->keycode = AM_KEY_NONE;

  uint32_t tmp = inl(KBD_ADDR);
  if (tmp != AM_KEY_NONE) {
    kbd->keydown = KEYDOWN_MASK & tmp;
    kbd->keycode = tmp & (~KEYDOWN_MASK);
  } else {
    kbd->keydown = false;
    kbd->keycode = AM_KEY_NONE;
  }
}
