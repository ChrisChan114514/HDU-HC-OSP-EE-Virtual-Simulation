// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"
// CREATED		"Mon Apr 21 15:29:21 2025"

module PWM(
	clk,
	GND,
	A,
	PWM_motor
);


input wire	clk;
input wire	GND;
input wire	[7:0] A;
output wire	PWM_motor;

wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_3;





CNT8B	b2v_inst(
	.clk(SYNTHESIZED_WIRE_4),
	.count(SYNTHESIZED_WIRE_1));  //计数器 产生PWM频率


COMP	b2v_inst1(
	.A(A),
	.B(SYNTHESIZED_WIRE_1),
	.eq(SYNTHESIZED_WIRE_3));  //比较器 产生PWM占空比


D	b2v_inst2(
	.clk(SYNTHESIZED_WIRE_4), 
	.D(SYNTHESIZED_WIRE_3),
	.Q(PWM_motor)); //D触发器 产生PWM输出


ABC	b2v_inst3(
	.inclk0(clk),
	.c0(SYNTHESIZED_WIRE_4)); //时钟分频器 产生PWM时钟
assign GND = 1'b0; // 将GND信号连接到逻辑0
assign PWM_motor = SYNTHESIZED_WIRE_3;
assign SYNTHESIZED_WIRE_4 = clk; // 将时钟信号直接连接到计数器和触发器的时钟输入



endmodule
