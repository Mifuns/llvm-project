//===-- floatundidf.c - Implement __floatundidf ---------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Referenced from floatundidf.c, but implemented in OpenCL language
//
//===----------------------------------------------------------------------===//

#ifdef cl_khr_fp64

#pragma OPENCL EXTENSION cl_khr_fp64 : enable

#include "types.h"

double __floatundidf(du_int a) {
  if (a == 0)
    return 0.0;
  const unsigned N = sizeof(du_int) * 8;
  int sd = N - __builtin_clzll(a);
  int e = sd - 1;
  if (sd > 53) {

    switch (sd) {
    case 53 + 1:
      a <<= 1;
      break;
    case 53 + 2:
      break;
    default:
      a = (a >> (sd - (53 + 2))) |
          ((a & ((du_int)(-1) >> ((N + 53 + 2) - sd))) != 0);
    };

    a |= (a & 4) != 0;
    ++a;
    a >>= 2;

    if (a & ((du_int)1 << 53)) {
      a >>= 1;
      ++e;
    }

  } else {
    a <<= (53 - sd);
  }
  double_bits fb;
  fb.u.s.high = ((su_int)(e + 1023) << 20) | ((su_int)(a >> 32) & 0x000FFFFF);
  fb.u.s.low = (su_int)a;
  return fb.f;
}

#endif
