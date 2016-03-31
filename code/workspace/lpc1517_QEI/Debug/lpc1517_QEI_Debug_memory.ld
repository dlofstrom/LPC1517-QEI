/*
 * GENERATED FILE - DO NOT EDIT
 * (c) Code Red Technologies Ltd, 2008-2013
 * (c) NXP Semiconductors 2013-2016
 * Generated linker script file for LPC1517
 * Created from memory.ldt by FMCreateLinkMemory
 * Using Freemarker v2.3.23
 * LPCXpresso v8.1.2 [Build 603] [2016-03-07]  on Mar 31, 2016 9:12:27 PM
 */

MEMORY
{
  /* Define each memory region */
  MFlash64 (rx) : ORIGIN = 0x0, LENGTH = 0x10000 /* 64K bytes (alias Flash) */  
  Ram0_4 (rwx) : ORIGIN = 0x2000000, LENGTH = 0x1000 /* 4K bytes (alias RAM) */  
  Ram1_4 (rwx) : ORIGIN = 0x2001000, LENGTH = 0x1000 /* 4K bytes (alias RAM2) */  
  Ram2_4 (rwx) : ORIGIN = 0x2002000, LENGTH = 0x1000 /* 4K bytes (alias RAM3) */  
}

  /* Define a symbol for the top of each memory region */
  __base_MFlash64 = 0x0  ; /* MFlash64 */  
  __base_Flash = 0x0 ; /* Flash */  
  __top_MFlash64 = 0x0 + 0x10000 ; /* 64K bytes */  
  __top_Flash = 0x0 + 0x10000 ; /* 64K bytes */  
  __base_Ram0_4 = 0x2000000  ; /* Ram0_4 */  
  __base_RAM = 0x2000000 ; /* RAM */  
  __top_Ram0_4 = 0x2000000 + 0x1000 ; /* 4K bytes */  
  __top_RAM = 0x2000000 + 0x1000 ; /* 4K bytes */  
  __base_Ram1_4 = 0x2001000  ; /* Ram1_4 */  
  __base_RAM2 = 0x2001000 ; /* RAM2 */  
  __top_Ram1_4 = 0x2001000 + 0x1000 ; /* 4K bytes */  
  __top_RAM2 = 0x2001000 + 0x1000 ; /* 4K bytes */  
  __base_Ram2_4 = 0x2002000  ; /* Ram2_4 */  
  __base_RAM3 = 0x2002000 ; /* RAM3 */  
  __top_Ram2_4 = 0x2002000 + 0x1000 ; /* 4K bytes */  
  __top_RAM3 = 0x2002000 + 0x1000 ; /* 4K bytes */  
