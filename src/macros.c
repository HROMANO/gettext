#include <locale.h>

#include "macros.h"

int ada_ctype (void) {
  return LC_CTYPE;
};

int ada_collate (void) {
  return LC_COLLATE;
};

int ada_monetary (void) {
  return LC_MONETARY;
};

int ada_numeric (void) {
  return LC_NUMERIC;
};

int ada_time (void) {
  return LC_TIME;
};

int ada_messages (void) {
  return LC_MESSAGES;
};

int ada_all (void) {
  return LC_ALL;
};
