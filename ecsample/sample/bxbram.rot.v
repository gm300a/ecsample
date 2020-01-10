// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed Nov 27 08:42:34 2019
// Host        : DESKTOP-JBKCM3T running 64-bit major release  (build 9200)
// Command     : write_verilog ./bxbram.rot.v
// Design      : bxbram
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticsg324-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "ce09c37c" *) (* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "0" *) 
(* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module bxbram
   (clk,
    we0,
    ce0,
    we1,
    ce1,
    adr,
    di0,
    di1,
    dq0,
    dq1);
  input clk;
  input we0;
  input ce0;
  input we1;
  input ce1;
  input [7:0]adr;
  input [7:0]di0;
  input [7:0]di1;
  output [7:0]dq0;
  output [7:0]dq1;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]adr;
  wire [7:0]adr_IBUF;
  wire ce0;
  wire ce0_IBUF;
  wire ce1;
  wire ce1_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]di0;
  wire [7:0]di0_IBUF;
  wire [7:0]di1;
  wire [7:0]di1_IBUF;
  wire [7:0]dq0;
  wire [7:0]dq0_OBUF;
  wire [7:0]dq1;
  wire [7:0]dq1_OBUF;
  wire we0;
  wire we0_IBUF;
  wire we1;
  wire we1_IBUF;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  IBUF \adr_IBUF[0]_inst 
       (.I(adr[0]),
        .O(adr_IBUF[0]));
  IBUF \adr_IBUF[1]_inst 
       (.I(adr[1]),
        .O(adr_IBUF[1]));
  IBUF \adr_IBUF[2]_inst 
       (.I(adr[2]),
        .O(adr_IBUF[2]));
  IBUF \adr_IBUF[3]_inst 
       (.I(adr[3]),
        .O(adr_IBUF[3]));
  IBUF \adr_IBUF[4]_inst 
       (.I(adr[4]),
        .O(adr_IBUF[4]));
  IBUF \adr_IBUF[5]_inst 
       (.I(adr[5]),
        .O(adr_IBUF[5]));
  IBUF \adr_IBUF[6]_inst 
       (.I(adr[6]),
        .O(adr_IBUF[6]));
  IBUF \adr_IBUF[7]_inst 
       (.I(adr[7]),
        .O(adr_IBUF[7]));
  IBUF ce0_IBUF_inst
       (.I(ce0),
        .O(ce0_IBUF));
  IBUF ce1_IBUF_inst
       (.I(ce1),
        .O(ce1_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF \di0_IBUF[0]_inst 
       (.I(di0[0]),
        .O(di0_IBUF[0]));
  IBUF \di0_IBUF[1]_inst 
       (.I(di0[1]),
        .O(di0_IBUF[1]));
  IBUF \di0_IBUF[2]_inst 
       (.I(di0[2]),
        .O(di0_IBUF[2]));
  IBUF \di0_IBUF[3]_inst 
       (.I(di0[3]),
        .O(di0_IBUF[3]));
  IBUF \di0_IBUF[4]_inst 
       (.I(di0[4]),
        .O(di0_IBUF[4]));
  IBUF \di0_IBUF[5]_inst 
       (.I(di0[5]),
        .O(di0_IBUF[5]));
  IBUF \di0_IBUF[6]_inst 
       (.I(di0[6]),
        .O(di0_IBUF[6]));
  IBUF \di0_IBUF[7]_inst 
       (.I(di0[7]),
        .O(di0_IBUF[7]));
  IBUF \di1_IBUF[0]_inst 
       (.I(di1[0]),
        .O(di1_IBUF[0]));
  IBUF \di1_IBUF[1]_inst 
       (.I(di1[1]),
        .O(di1_IBUF[1]));
  IBUF \di1_IBUF[2]_inst 
       (.I(di1[2]),
        .O(di1_IBUF[2]));
  IBUF \di1_IBUF[3]_inst 
       (.I(di1[3]),
        .O(di1_IBUF[3]));
  IBUF \di1_IBUF[4]_inst 
       (.I(di1[4]),
        .O(di1_IBUF[4]));
  IBUF \di1_IBUF[5]_inst 
       (.I(di1[5]),
        .O(di1_IBUF[5]));
  IBUF \di1_IBUF[6]_inst 
       (.I(di1[6]),
        .O(di1_IBUF[6]));
  IBUF \di1_IBUF[7]_inst 
       (.I(di1[7]),
        .O(di1_IBUF[7]));
  OBUF \dq0_OBUF[0]_inst 
       (.I(dq0_OBUF[0]),
        .O(dq0[0]));
  OBUF \dq0_OBUF[1]_inst 
       (.I(dq0_OBUF[1]),
        .O(dq0[1]));
  OBUF \dq0_OBUF[2]_inst 
       (.I(dq0_OBUF[2]),
        .O(dq0[2]));
  OBUF \dq0_OBUF[3]_inst 
       (.I(dq0_OBUF[3]),
        .O(dq0[3]));
  OBUF \dq0_OBUF[4]_inst 
       (.I(dq0_OBUF[4]),
        .O(dq0[4]));
  OBUF \dq0_OBUF[5]_inst 
       (.I(dq0_OBUF[5]),
        .O(dq0[5]));
  OBUF \dq0_OBUF[6]_inst 
       (.I(dq0_OBUF[6]),
        .O(dq0[6]));
  OBUF \dq0_OBUF[7]_inst 
       (.I(dq0_OBUF[7]),
        .O(dq0[7]));
  OBUF \dq1_OBUF[0]_inst 
       (.I(dq1_OBUF[0]),
        .O(dq1[0]));
  OBUF \dq1_OBUF[1]_inst 
       (.I(dq1_OBUF[1]),
        .O(dq1[1]));
  OBUF \dq1_OBUF[2]_inst 
       (.I(dq1_OBUF[2]),
        .O(dq1[2]));
  OBUF \dq1_OBUF[3]_inst 
       (.I(dq1_OBUF[3]),
        .O(dq1[3]));
  OBUF \dq1_OBUF[4]_inst 
       (.I(dq1_OBUF[4]),
        .O(dq1[4]));
  OBUF \dq1_OBUF[5]_inst 
       (.I(dq1_OBUF[5]),
        .O(dq1[5]));
  OBUF \dq1_OBUF[6]_inst 
       (.I(dq1_OBUF[6]),
        .O(dq1[6]));
  OBUF \dq1_OBUF[7]_inst 
       (.I(dq1_OBUF[7]),
        .O(dq1[7]));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem0" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    mem0_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,adr_IBUF,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(\<const0> ),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,di0_IBUF}),
        .DIBDI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const1> ,\<const1> }),
        .DOADO(dq0_OBUF),
        .ENARDEN(ce0_IBUF),
        .ENBWREN(\<const0> ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({we0_IBUF,we0_IBUF}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem1" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    mem1_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,adr_IBUF,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(\<const0> ),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,di1_IBUF}),
        .DIBDI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const1> ,\<const1> }),
        .DOADO(dq1_OBUF),
        .ENARDEN(ce1_IBUF),
        .ENBWREN(\<const0> ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({we1_IBUF,we1_IBUF}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  IBUF we0_IBUF_inst
       (.I(we0),
        .O(we0_IBUF));
  IBUF we1_IBUF_inst
       (.I(we1),
        .O(we1_IBUF));
endmodule
