#!/bin/sh
#
# This file was automatically generated.
#
# It can be overwritten by nios2-flash-programmer-generate or nios2-flash-programmer-gui.
#

#
# Converting SOF File: D:\work\lcd_all_colorbar\par\output_files\lcd_all_colorbar.sof to: "..\flash/lcd_all_colorbar_epcs_flash.flash"
#
sof2flash --input="D:/work/lcd_all_colorbar/par/output_files/lcd_all_colorbar.sof" --output="../flash/lcd_all_colorbar_epcs_flash.flash" --epcs --verbose 

#
# Programming File: "..\flash/lcd_all_colorbar_epcs_flash.flash" To Device: epcs_flash
#
nios2-flash-programmer "../flash/lcd_all_colorbar_epcs_flash.flash" --base=0x4001000 --epcs --sidp=0x40020B0 --id=0x0 --timestamp=1543545716 --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program --verbose 

#
# Converting ELF File: D:\work\lcd_all_colorbar\qsys\software\colorbar\colorbar.elf to: "..\flash/colorbar_epcs_flash.flash"
#
elf2flash --input="D:/work/lcd_all_colorbar/qsys/software/colorbar/colorbar.elf" --output="../flash/colorbar_epcs_flash.flash" --epcs --after="../flash/lcd_all_colorbar_epcs_flash.flash" --verbose 

#
# Programming File: "..\flash/colorbar_epcs_flash.flash" To Device: epcs_flash
#
nios2-flash-programmer "../flash/colorbar_epcs_flash.flash" --base=0x4001000 --epcs --sidp=0x40020B0 --id=0x0 --timestamp=1543545716 --device=1 --instance=0 '--cable=USB-Blaster on localhost [USB-0]' --program --verbose 

