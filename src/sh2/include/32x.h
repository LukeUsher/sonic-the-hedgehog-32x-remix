#ifndef __32X_H__
#define __32X_H__

#include <stdint.h>

/* Create a 5:5:5 RGB colour */
#define COLOR(r,g,b)    (((r)&0x1F)|((g)&0x1F)<<5|((b)&0x1F)<<10|0x8000)
/* Create a 5:5:5 RGB background colour */
#define BG_COLOR(r,g,b)    (((r)&0x1F)|((g)&0x1F)<<5|((b)&0x1F)<<10)
 
#define MARS_CRAM           (*(volatile unsigned short *)0x20004200)
#define MARS_FRAMEBUFFER    (*(volatile unsigned short *)0x24000000)
#define MARS_OVERWRITE_IMG  (*(volatile unsigned short *)0x24020000)
#define MARS_SDRAM          (*(volatile unsigned short *)0x26000000)

#define MARS_SYS_INTMSK     (*(volatile unsigned short *)0x20004000)
#define MARS_SYS_DMACTR     (*(volatile unsigned short *)0x20004006)
#define MARS_SYS_DMASAR     (*(volatile unsigned long *)0x20004008)
#define MARS_SYS_DMADAR     (*(volatile unsigned long *)0x2000400C)
#define MARS_SYS_DMALEN     (*(volatile unsigned short *)0x20004010)
#define MARS_SYS_DMAFIFO    (*(volatile unsigned short *)0x20004012)
#define MARS_SYS_VRESI_CLR  (*(volatile unsigned short *)0x20004014)
#define MARS_SYS_VINT_CLR   (*(volatile unsigned short *)0x20004016)
#define MARS_SYS_HINT_CLR   (*(volatile unsigned short *)0x20004018)
#define MARS_SYS_CMDI_CLR   (*(volatile unsigned short *)0x2000401A)
#define MARS_SYS_PWMI_CLR   (*(volatile unsigned short *)0x2000401C)
#define MARS_SYS_COMM0      (*(volatile unsigned short *)0x20004020) /* Master SH2 communication */
#define MARS_SYS_COMM2      (*(volatile unsigned short *)0x20004022)
#define MARS_SYS_COMM4      (*(volatile unsigned short *)0x20004024) 
#define MARS_SYS_COMM6      (*(volatile unsigned short *)0x20004026)
#define MARS_SYS_COMM8      (*(volatile unsigned short *)0x20004028) /* Slave SH2 communication */
#define MARS_SYS_COMMA      (*(volatile unsigned short *)0x2000402A) 
#define MARS_SYS_COMMC      (*(volatile unsigned short *)0x2000402C) 
#define MARS_SYS_COMME      (*(volatile unsigned short *)0x2000402E) 

#define MARS_PWM_CTRL       (*(volatile unsigned short *)0x20004030)
#define MARS_PWM_CYCLE      (*(volatile unsigned short *)0x20004032)
#define MARS_PWM_LEFT       (*(volatile unsigned short *)0x20004034)
#define MARS_PWM_RIGHT      (*(volatile unsigned short *)0x20004036)
#define MARS_PWM_MONO       (*(volatile unsigned short *)0x20004038)

#define MARS_VDP_DISPMODE   (*(volatile unsigned short *)0x20004100)
#define MARS_VDP_FILLEN     (*(volatile unsigned short *)0x20004104)
#define MARS_VDP_FILADR     (*(volatile unsigned short *)0x20004106)
#define MARS_VDP_FILDAT     (*(volatile unsigned short *)0x20004108)
#define MARS_VDP_FBCTL      (*(volatile unsigned short *)0x2000410A)

#define MARS_SH2_ACCESS_VDP 0x8000
#define MARS_68K_ACCESS_VDP 0x0000

#define MARS_PAL_FORMAT     0x0000
#define MARS_NTSC_FORMAT    0x8000

#define MARS_VDP_PRIO_68K   0x0000
#define MARS_VDP_PRIO_32X   0x0080

#define MARS_224_LINES      0x0000
#define MARS_240_LINES      0x0040

#define MARS_VDP_MODE_OFF   0x0000
#define MARS_VDP_MODE_256   0x0001
#define MARS_VDP_MODE_32K   0x0002
#define MARS_VDP_MODE_RLE   0x0003

#define MARS_VDP_VBLK       0x8000
#define MARS_VDP_HBLK       0x4000
#define MARS_VDP_PEN        0x2000
#define MARS_VDP_FEN        0x0002
#define MARS_VDP_FS         0x0001

#define SH2_CCTL_CP         0x10
#define SH2_CCTL_TW         0x08
#define SH2_CCTL_CE         0x01

#define SH2_FRT_TIER        (*(volatile unsigned char *)0xFFFFFE10)
#define SH2_FRT_FTCSR       (*(volatile unsigned char *)0xFFFFFE11)
#define SH2_FRT_FRCH        (*(volatile unsigned char *)0xFFFFFE12)
#define SH2_FRT_FRCL        (*(volatile unsigned char *)0xFFFFFE13)
#define SH2_FRT_OCRH        (*(volatile unsigned char *)0xFFFFFE14)
#define SH2_FRT_OCRL        (*(volatile unsigned char *)0xFFFFFE15)
#define SH2_FRT_TCR         (*(volatile unsigned char *)0xFFFFFE16)
#define SH2_FRT_TOCR        (*(volatile unsigned char *)0xFFFFFE17)
#define SH2_FRT_ICRH        (*(volatile unsigned char *)0xFFFFFE18)
#define SH2_FRT_ICRL        (*(volatile unsigned char *)0xFFFFFE19)

#define SH2_DMA_SAR0        (*(volatile unsigned long *)0xFFFFFF80)
#define SH2_DMA_DAR0        (*(volatile unsigned long *)0xFFFFFF84)
#define SH2_DMA_TCR0        (*(volatile unsigned long *)0xFFFFFF88)
#define SH2_DMA_CHCR0       (*(volatile unsigned long *)0xFFFFFF8C)
#define SH2_DMA_VCR0        (*(volatile unsigned long *)0xFFFFFFA0)
#define SH2_DMA_DRCR0       (*(volatile unsigned char *)0xFFFFFE71)

#define SH2_DMA_SAR1        (*(volatile unsigned long *)0xFFFFFF90)
#define SH2_DMA_DAR1        (*(volatile unsigned long *)0xFFFFFF94)
#define SH2_DMA_TCR1        (*(volatile unsigned long *)0xFFFFFF98)
#define SH2_DMA_CHCR1       (*(volatile unsigned long *)0xFFFFFF9C)
#define SH2_DMA_VCR1        (*(volatile unsigned long *)0xFFFFFFA8)
#define SH2_DMA_DRCR1       (*(volatile unsigned char *)0xFFFFFE72)

#define SH2_DMA_DMAOR       (*(volatile unsigned long *)0xFFFFFFB0)

#define SH2_INT_IPRA        (*(volatile unsigned short *)0xFFFFFEE2)

/* global functions in crt0.s */
extern int SetSH2SR(int level);
extern void CacheControl(int mode);
extern void CacheClearLine(void* ptr);
extern void fast_memcpy(void *dst, void *src, int len);

#endif
