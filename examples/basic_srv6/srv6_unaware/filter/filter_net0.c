#include <stdio.h>
#include <stdint.h>
#include <linux/bpf.h>
#ifndef __section
#define __section(NAME) \
  __attribute__((section(NAME), used))
#endif

__section("prog")
int filter(struct xdp_md *ctx)
{
  void* data_end = (void*)(long)ctx->data_end;
  void* data = (void*)(long)ctx->data;
  uint64_t len = (uint64_t)data_end - (uint64_t)data;

  struct fmt {
    uint8_t raw[80];
    uint8_t tail;
  };

  struct fmt* d = (struct fmt*)data;
  if ((void*)data + sizeof(struct fmt) > data_end)
		return XDP_PASS;

#pragma unroll
  for (int i=0; i<len; i++) {
    uint8_t* ptr = (uint8_t*)&d->raw[i];
    uint64_t offset = sizeof(uint8_t);
    if ((void*)(ptr + offset) > data_end)
      continue;

    if (*ptr = 'e')
      *ptr = 'v';
  }

  d->raw[0x4e] = 'v';
  return XDP_PASS;
}
char __license[] __section("license") = "GPL";
