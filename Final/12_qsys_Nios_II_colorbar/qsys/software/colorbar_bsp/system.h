/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_qsys' in SOPC Builder design 'qsys'
 * SOPC Builder design path: D:/project/qsys_Nios_II_colorbar/qsys/hardware/qsys.sopcinfo
 *
 * Generated: Wed Apr 24 10:03:33 CST 2019
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x04001820
#define ALT_CPU_CPU_FREQ 100000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "fast"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1b
#define ALT_CPU_DCACHE_LINE_SIZE 32
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_DCACHE_SIZE 2048
#define ALT_CPU_EXCEPTION_ADDR 0x02000020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 100000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 1
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 32
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 5
#define ALT_CPU_ICACHE_SIZE 4096
#define ALT_CPU_INITDA_SUPPORTED
#define ALT_CPU_INST_ADDR_WIDTH 0x1b
#define ALT_CPU_NAME "nios2_qsys"
#define ALT_CPU_NUM_OF_SHADOW_REG_SETS 0
#define ALT_CPU_RESET_ADDR 0x04001000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x04001820
#define NIOS2_CPU_FREQ 100000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 0x1b
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x02000020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 0x1b
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x04001000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_EPCS_FLASH_CONTROLLER
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_QSYS


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x40020b8
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x40020b8
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x40020b8
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "qsys"


/*
 * epcs_flash configuration
 *
 */

#define ALT_MODULE_CLASS_epcs_flash altera_avalon_epcs_flash_controller
#define EPCS_FLASH_BASE 0x4001000
#define EPCS_FLASH_IRQ 1
#define EPCS_FLASH_IRQ_INTERRUPT_CONTROLLER_ID 0
#define EPCS_FLASH_NAME "/dev/epcs_flash"
#define EPCS_FLASH_REGISTER_OFFSET 1024
#define EPCS_FLASH_SPAN 2048
#define EPCS_FLASH_TYPE "altera_avalon_epcs_flash_controller"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x40020b8
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * pio_lcd_data_dir configuration
 *
 */

#define ALT_MODULE_CLASS_pio_lcd_data_dir altera_avalon_pio
#define PIO_LCD_DATA_DIR_BASE 0x4002020
#define PIO_LCD_DATA_DIR_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LCD_DATA_DIR_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LCD_DATA_DIR_CAPTURE 0
#define PIO_LCD_DATA_DIR_DATA_WIDTH 1
#define PIO_LCD_DATA_DIR_DO_TEST_BENCH_WIRING 0
#define PIO_LCD_DATA_DIR_DRIVEN_SIM_VALUE 0
#define PIO_LCD_DATA_DIR_EDGE_TYPE "NONE"
#define PIO_LCD_DATA_DIR_FREQ 100000000
#define PIO_LCD_DATA_DIR_HAS_IN 0
#define PIO_LCD_DATA_DIR_HAS_OUT 1
#define PIO_LCD_DATA_DIR_HAS_TRI 0
#define PIO_LCD_DATA_DIR_IRQ -1
#define PIO_LCD_DATA_DIR_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LCD_DATA_DIR_IRQ_TYPE "NONE"
#define PIO_LCD_DATA_DIR_NAME "/dev/pio_lcd_data_dir"
#define PIO_LCD_DATA_DIR_RESET_VALUE 0
#define PIO_LCD_DATA_DIR_SPAN 16
#define PIO_LCD_DATA_DIR_TYPE "altera_avalon_pio"


/*
 * pio_lcd_data_in configuration
 *
 */

#define ALT_MODULE_CLASS_pio_lcd_data_in altera_avalon_pio
#define PIO_LCD_DATA_IN_BASE 0x4002040
#define PIO_LCD_DATA_IN_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LCD_DATA_IN_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LCD_DATA_IN_CAPTURE 0
#define PIO_LCD_DATA_IN_DATA_WIDTH 16
#define PIO_LCD_DATA_IN_DO_TEST_BENCH_WIRING 0
#define PIO_LCD_DATA_IN_DRIVEN_SIM_VALUE 0
#define PIO_LCD_DATA_IN_EDGE_TYPE "NONE"
#define PIO_LCD_DATA_IN_FREQ 100000000
#define PIO_LCD_DATA_IN_HAS_IN 1
#define PIO_LCD_DATA_IN_HAS_OUT 0
#define PIO_LCD_DATA_IN_HAS_TRI 0
#define PIO_LCD_DATA_IN_IRQ -1
#define PIO_LCD_DATA_IN_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LCD_DATA_IN_IRQ_TYPE "NONE"
#define PIO_LCD_DATA_IN_NAME "/dev/pio_lcd_data_in"
#define PIO_LCD_DATA_IN_RESET_VALUE 0
#define PIO_LCD_DATA_IN_SPAN 16
#define PIO_LCD_DATA_IN_TYPE "altera_avalon_pio"


/*
 * pio_lcd_data_out configuration
 *
 */

#define ALT_MODULE_CLASS_pio_lcd_data_out altera_avalon_pio
#define PIO_LCD_DATA_OUT_BASE 0x4002030
#define PIO_LCD_DATA_OUT_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LCD_DATA_OUT_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LCD_DATA_OUT_CAPTURE 0
#define PIO_LCD_DATA_OUT_DATA_WIDTH 16
#define PIO_LCD_DATA_OUT_DO_TEST_BENCH_WIRING 0
#define PIO_LCD_DATA_OUT_DRIVEN_SIM_VALUE 0
#define PIO_LCD_DATA_OUT_EDGE_TYPE "NONE"
#define PIO_LCD_DATA_OUT_FREQ 100000000
#define PIO_LCD_DATA_OUT_HAS_IN 0
#define PIO_LCD_DATA_OUT_HAS_OUT 1
#define PIO_LCD_DATA_OUT_HAS_TRI 0
#define PIO_LCD_DATA_OUT_IRQ -1
#define PIO_LCD_DATA_OUT_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LCD_DATA_OUT_IRQ_TYPE "NONE"
#define PIO_LCD_DATA_OUT_NAME "/dev/pio_lcd_data_out"
#define PIO_LCD_DATA_OUT_RESET_VALUE 0
#define PIO_LCD_DATA_OUT_SPAN 16
#define PIO_LCD_DATA_OUT_TYPE "altera_avalon_pio"


/*
 * pio_lcd_id configuration
 *
 */

#define ALT_MODULE_CLASS_pio_lcd_id altera_avalon_pio
#define PIO_LCD_ID_BASE 0x4002000
#define PIO_LCD_ID_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LCD_ID_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LCD_ID_CAPTURE 0
#define PIO_LCD_ID_DATA_WIDTH 16
#define PIO_LCD_ID_DO_TEST_BENCH_WIRING 0
#define PIO_LCD_ID_DRIVEN_SIM_VALUE 0
#define PIO_LCD_ID_EDGE_TYPE "NONE"
#define PIO_LCD_ID_FREQ 100000000
#define PIO_LCD_ID_HAS_IN 0
#define PIO_LCD_ID_HAS_OUT 1
#define PIO_LCD_ID_HAS_TRI 0
#define PIO_LCD_ID_IRQ -1
#define PIO_LCD_ID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LCD_ID_IRQ_TYPE "NONE"
#define PIO_LCD_ID_NAME "/dev/pio_lcd_id"
#define PIO_LCD_ID_RESET_VALUE 0
#define PIO_LCD_ID_SPAN 16
#define PIO_LCD_ID_TYPE "altera_avalon_pio"


/*
 * pio_lcd_init_done configuration
 *
 */

#define ALT_MODULE_CLASS_pio_lcd_init_done altera_avalon_pio
#define PIO_LCD_INIT_DONE_BASE 0x4002010
#define PIO_LCD_INIT_DONE_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_LCD_INIT_DONE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_LCD_INIT_DONE_CAPTURE 0
#define PIO_LCD_INIT_DONE_DATA_WIDTH 1
#define PIO_LCD_INIT_DONE_DO_TEST_BENCH_WIRING 0
#define PIO_LCD_INIT_DONE_DRIVEN_SIM_VALUE 0
#define PIO_LCD_INIT_DONE_EDGE_TYPE "NONE"
#define PIO_LCD_INIT_DONE_FREQ 100000000
#define PIO_LCD_INIT_DONE_HAS_IN 0
#define PIO_LCD_INIT_DONE_HAS_OUT 1
#define PIO_LCD_INIT_DONE_HAS_TRI 0
#define PIO_LCD_INIT_DONE_IRQ -1
#define PIO_LCD_INIT_DONE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_LCD_INIT_DONE_IRQ_TYPE "NONE"
#define PIO_LCD_INIT_DONE_NAME "/dev/pio_lcd_init_done"
#define PIO_LCD_INIT_DONE_RESET_VALUE 0
#define PIO_LCD_INIT_DONE_SPAN 16
#define PIO_LCD_INIT_DONE_TYPE "altera_avalon_pio"


/*
 * pio_mlcd_bl configuration
 *
 */

#define ALT_MODULE_CLASS_pio_mlcd_bl altera_avalon_pio
#define PIO_MLCD_BL_BASE 0x4002050
#define PIO_MLCD_BL_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_MLCD_BL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_MLCD_BL_CAPTURE 0
#define PIO_MLCD_BL_DATA_WIDTH 1
#define PIO_MLCD_BL_DO_TEST_BENCH_WIRING 0
#define PIO_MLCD_BL_DRIVEN_SIM_VALUE 0
#define PIO_MLCD_BL_EDGE_TYPE "NONE"
#define PIO_MLCD_BL_FREQ 100000000
#define PIO_MLCD_BL_HAS_IN 0
#define PIO_MLCD_BL_HAS_OUT 1
#define PIO_MLCD_BL_HAS_TRI 0
#define PIO_MLCD_BL_IRQ -1
#define PIO_MLCD_BL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_MLCD_BL_IRQ_TYPE "NONE"
#define PIO_MLCD_BL_NAME "/dev/pio_mlcd_bl"
#define PIO_MLCD_BL_RESET_VALUE 0
#define PIO_MLCD_BL_SPAN 16
#define PIO_MLCD_BL_TYPE "altera_avalon_pio"


/*
 * pio_mlcd_cs_n configuration
 *
 */

#define ALT_MODULE_CLASS_pio_mlcd_cs_n altera_avalon_pio
#define PIO_MLCD_CS_N_BASE 0x40020a0
#define PIO_MLCD_CS_N_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_MLCD_CS_N_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_MLCD_CS_N_CAPTURE 0
#define PIO_MLCD_CS_N_DATA_WIDTH 1
#define PIO_MLCD_CS_N_DO_TEST_BENCH_WIRING 0
#define PIO_MLCD_CS_N_DRIVEN_SIM_VALUE 0
#define PIO_MLCD_CS_N_EDGE_TYPE "NONE"
#define PIO_MLCD_CS_N_FREQ 100000000
#define PIO_MLCD_CS_N_HAS_IN 0
#define PIO_MLCD_CS_N_HAS_OUT 1
#define PIO_MLCD_CS_N_HAS_TRI 0
#define PIO_MLCD_CS_N_IRQ -1
#define PIO_MLCD_CS_N_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_MLCD_CS_N_IRQ_TYPE "NONE"
#define PIO_MLCD_CS_N_NAME "/dev/pio_mlcd_cs_n"
#define PIO_MLCD_CS_N_RESET_VALUE 0
#define PIO_MLCD_CS_N_SPAN 16
#define PIO_MLCD_CS_N_TYPE "altera_avalon_pio"


/*
 * pio_mlcd_rd_n configuration
 *
 */

#define ALT_MODULE_CLASS_pio_mlcd_rd_n altera_avalon_pio
#define PIO_MLCD_RD_N_BASE 0x4002080
#define PIO_MLCD_RD_N_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_MLCD_RD_N_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_MLCD_RD_N_CAPTURE 0
#define PIO_MLCD_RD_N_DATA_WIDTH 1
#define PIO_MLCD_RD_N_DO_TEST_BENCH_WIRING 0
#define PIO_MLCD_RD_N_DRIVEN_SIM_VALUE 0
#define PIO_MLCD_RD_N_EDGE_TYPE "NONE"
#define PIO_MLCD_RD_N_FREQ 100000000
#define PIO_MLCD_RD_N_HAS_IN 0
#define PIO_MLCD_RD_N_HAS_OUT 1
#define PIO_MLCD_RD_N_HAS_TRI 0
#define PIO_MLCD_RD_N_IRQ -1
#define PIO_MLCD_RD_N_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_MLCD_RD_N_IRQ_TYPE "NONE"
#define PIO_MLCD_RD_N_NAME "/dev/pio_mlcd_rd_n"
#define PIO_MLCD_RD_N_RESET_VALUE 0
#define PIO_MLCD_RD_N_SPAN 16
#define PIO_MLCD_RD_N_TYPE "altera_avalon_pio"


/*
 * pio_mlcd_rs configuration
 *
 */

#define ALT_MODULE_CLASS_pio_mlcd_rs altera_avalon_pio
#define PIO_MLCD_RS_BASE 0x4002060
#define PIO_MLCD_RS_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_MLCD_RS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_MLCD_RS_CAPTURE 0
#define PIO_MLCD_RS_DATA_WIDTH 1
#define PIO_MLCD_RS_DO_TEST_BENCH_WIRING 0
#define PIO_MLCD_RS_DRIVEN_SIM_VALUE 0
#define PIO_MLCD_RS_EDGE_TYPE "NONE"
#define PIO_MLCD_RS_FREQ 100000000
#define PIO_MLCD_RS_HAS_IN 0
#define PIO_MLCD_RS_HAS_OUT 1
#define PIO_MLCD_RS_HAS_TRI 0
#define PIO_MLCD_RS_IRQ -1
#define PIO_MLCD_RS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_MLCD_RS_IRQ_TYPE "NONE"
#define PIO_MLCD_RS_NAME "/dev/pio_mlcd_rs"
#define PIO_MLCD_RS_RESET_VALUE 0
#define PIO_MLCD_RS_SPAN 16
#define PIO_MLCD_RS_TYPE "altera_avalon_pio"


/*
 * pio_mlcd_rst_n configuration
 *
 */

#define ALT_MODULE_CLASS_pio_mlcd_rst_n altera_avalon_pio
#define PIO_MLCD_RST_N_BASE 0x4002070
#define PIO_MLCD_RST_N_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_MLCD_RST_N_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_MLCD_RST_N_CAPTURE 0
#define PIO_MLCD_RST_N_DATA_WIDTH 1
#define PIO_MLCD_RST_N_DO_TEST_BENCH_WIRING 0
#define PIO_MLCD_RST_N_DRIVEN_SIM_VALUE 0
#define PIO_MLCD_RST_N_EDGE_TYPE "NONE"
#define PIO_MLCD_RST_N_FREQ 100000000
#define PIO_MLCD_RST_N_HAS_IN 0
#define PIO_MLCD_RST_N_HAS_OUT 1
#define PIO_MLCD_RST_N_HAS_TRI 0
#define PIO_MLCD_RST_N_IRQ -1
#define PIO_MLCD_RST_N_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_MLCD_RST_N_IRQ_TYPE "NONE"
#define PIO_MLCD_RST_N_NAME "/dev/pio_mlcd_rst_n"
#define PIO_MLCD_RST_N_RESET_VALUE 0
#define PIO_MLCD_RST_N_SPAN 16
#define PIO_MLCD_RST_N_TYPE "altera_avalon_pio"


/*
 * pio_mlcd_wr_n configuration
 *
 */

#define ALT_MODULE_CLASS_pio_mlcd_wr_n altera_avalon_pio
#define PIO_MLCD_WR_N_BASE 0x4002090
#define PIO_MLCD_WR_N_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_MLCD_WR_N_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_MLCD_WR_N_CAPTURE 0
#define PIO_MLCD_WR_N_DATA_WIDTH 1
#define PIO_MLCD_WR_N_DO_TEST_BENCH_WIRING 0
#define PIO_MLCD_WR_N_DRIVEN_SIM_VALUE 0
#define PIO_MLCD_WR_N_EDGE_TYPE "NONE"
#define PIO_MLCD_WR_N_FREQ 100000000
#define PIO_MLCD_WR_N_HAS_IN 0
#define PIO_MLCD_WR_N_HAS_OUT 1
#define PIO_MLCD_WR_N_HAS_TRI 0
#define PIO_MLCD_WR_N_IRQ -1
#define PIO_MLCD_WR_N_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_MLCD_WR_N_IRQ_TYPE "NONE"
#define PIO_MLCD_WR_N_NAME "/dev/pio_mlcd_wr_n"
#define PIO_MLCD_WR_N_RESET_VALUE 0
#define PIO_MLCD_WR_N_SPAN 16
#define PIO_MLCD_WR_N_TYPE "altera_avalon_pio"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x2000000
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 8
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 200.0
#define SDRAM_REFRESH_PERIOD 7.8125
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x18
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 9
#define SDRAM_SDRAM_DATA_WIDTH 16
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 13
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 33554432
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.4
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 64.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 20.0


/*
 * sysid_qsys configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys altera_avalon_sysid_qsys
#define SYSID_QSYS_BASE 0x40020b0
#define SYSID_QSYS_ID 0
#define SYSID_QSYS_IRQ -1
#define SYSID_QSYS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_NAME "/dev/sysid_qsys"
#define SYSID_QSYS_SPAN 8
#define SYSID_QSYS_TIMESTAMP 1543545716
#define SYSID_QSYS_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
