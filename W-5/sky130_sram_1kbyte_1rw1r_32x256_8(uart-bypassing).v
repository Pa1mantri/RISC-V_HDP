// OpenRAM SRAM model
// Words: 512
// Word size: 32
// Write size: 8

module sky130_sram_1kbyte_1rw1r_32x256_8_inst(
`ifdef USE_POWER_PINS
    vccd1,
    vssd1,
`endif
// Port 0: RW
    clk0,csb0,web0,wmask0,addr0,din0,dout0,
// Port 1: R
    clk1,csb1,addr1,dout1
  );

  parameter NUM_WMASKS = 4 ;
  parameter DATA_WIDTH = 32 ;
  parameter ADDR_WIDTH = 8 ;
  parameter RAM_DEPTH = 1 << ADDR_WIDTH;
  // FIXME: This delay is arbitrary.
  parameter DELAY = 0 ;
  parameter VERBOSE = 0 ; //Set to 0 to only display warnings
  parameter T_HOLD = 0 ; //Delay to hold dout value after posedge. Value is arbitrary

`ifdef USE_POWER_PINS
    inout vccd1;
    inout vssd1;
`endif
  input  clk0; // clock
  input   csb0; // active low chip select
  input  web0; // active low write control
  input [NUM_WMASKS-1:0]   wmask0; // write mask
  input [ADDR_WIDTH-1:0]  addr0;
  input [DATA_WIDTH-1:0]  din0;
  output [DATA_WIDTH-1:0] dout0;
  input  clk1; // clock
  input   csb1; // active low chip select
  input [ADDR_WIDTH-1:0]  addr1;
  output [DATA_WIDTH-1:0] dout1;

  reg  csb0_reg;
  reg  web0_reg;
  reg [NUM_WMASKS-1:0]   wmask0_reg;
  reg [ADDR_WIDTH-1:0]  addr0_reg;
  reg [DATA_WIDTH-1:0]  din0_reg;
  reg [DATA_WIDTH-1:0]  dout0;

  // All inputs are registers
  always @(posedge clk0)
  begin
    csb0_reg = csb0;
    web0_reg = web0;
    wmask0_reg = wmask0;
    addr0_reg = addr0;
    din0_reg = din0;
    #(T_HOLD) dout0 = 32'bx;
    if ( !csb0_reg && web0_reg && VERBOSE ) 
      $display($time," Reading %m addr0=%b dout0=%b",addr0_reg,mem[addr0_reg]);
    if ( !csb0_reg && !web0_reg && VERBOSE )
      $display($time," Writing %m addr0=%b din0=%b wmask0=%b",addr0_reg,din0_reg,wmask0_reg);
  end

  reg  csb1_reg;
  reg [ADDR_WIDTH-1:0]  addr1_reg;
  reg [DATA_WIDTH-1:0]  dout1;

  // All inputs are registers
  always @(posedge clk1)
  begin
    csb1_reg = csb1;
    addr1_reg = addr1;
    if (!csb0 && !web0 && !csb1 && (addr0 == addr1))
         $display($time," WARNING: Writing and reading addr0=%b and addr1=%b simultaneously!",addr0,addr1);
    #(T_HOLD) dout1 = 32'bx;
    if ( !csb1_reg && VERBOSE ) 
      $display($time," Reading %m addr1=%b dout1=%b",addr1_reg,mem[addr1_reg]);
  end

reg [DATA_WIDTH-1:0]    mem [0:RAM_DEPTH-1];

  initial
  begin

	mem[0] = 32'h00000000;
	mem[1] = 32'h00000000;
	mem[2] = 32'hfc010113;
	mem[3] = 32'h02812e23;
	mem[4] = 32'h04010413;
	mem[5] = 32'hfe042623;
	mem[6] = 32'hffe00793;
	mem[7] = 32'hfef42023;
	mem[8] = 32'h00100793;
	mem[9] = 32'hfcf42e23;
	mem[10] = 32'hfe042783;
	mem[11] = 32'hfdc42703;
	mem[12] = 32'h00ff7f33;
	mem[13] = 32'h00ef6f33;
	mem[14] = 32'h001f7793;
	mem[15] = 32'hfcf42c23;
	mem[16] = 32'hfd842703;
	mem[17] = 32'h00100793;
	mem[18] = 32'hfcf718e3;
	mem[19] = 32'hffd00793;
	mem[20] = 32'hfcf42a23;
	mem[21] = 32'h00200793;
	mem[22] = 32'hfcf42823;
	mem[23] = 32'hfd042783;
	mem[24] = 32'hfd442703;
	mem[25] = 32'h00ef7f33;
	mem[26] = 32'h00ff6f33;
	mem[27] = 32'hfec42703;
	mem[28] = 32'h00100793;
	mem[29] = 32'h02f71463;
	mem[30] = 32'hfe042623;
	mem[31] = 32'hffb00793;
	mem[32] = 32'hfcf42a23;
	mem[33] = 32'hfc042623;
	mem[34] = 32'hfcc42783;
	mem[35] = 32'hfd442703;
	mem[36] = 32'h00ef7f33;
	mem[37] = 32'h00ff6f33;
	mem[38] = 32'h0300006f;
	mem[39] = 32'h00100793;
	mem[40] = 32'hfef42623;
	mem[41] = 32'h100007b7;
	mem[42] = 32'hffb78793;
	mem[43] = 32'hfcf42a23;
	mem[44] = 32'h00400793;
	mem[45] = 32'hfcf42423;
	mem[46] = 32'hfc842783;
	mem[47] = 32'hfd442703;
	mem[48] = 32'h00ef7f33;
	mem[49] = 32'h00ff6f33;
	mem[50] = 32'hfe042423;
	mem[51] = 32'h0300006f;
	mem[52] = 32'hfe042223;
	mem[53] = 32'h0100006f;
	mem[54] = 32'hfe442783;
	mem[55] = 32'h00178793;
	mem[56] = 32'hfef42223;
	mem[57] = 32'hfe442703;
	mem[58] = 32'h00900793;
	mem[59] = 32'hfee7d6e3;
	mem[60] = 32'hfe842783;
	mem[61] = 32'h00178793;
	mem[62] = 32'hfef42423;
	mem[63] = 32'hfe842703;
	mem[64] = 32'h00900793;
	mem[65] = 32'hfce7d6e3;
	mem[66] = 32'hffd00793;
	mem[67] = 32'hfcf42a23;
	mem[68] = 32'hfc042823;
	mem[69] = 32'hfd042783;
	mem[70] = 32'hfd442703;
	mem[71] = 32'h00ef7f33;
	mem[72] = 32'h00ff6f33;
	mem[73] = 32'hef5ff06f;
	mem[74] = 32'hffffffff;
	mem[75] = 32'hffffffff;

   end

  // Memory Write Block Port 0
  // Write Operation : When web0 = 0, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_WRITE0
    if ( !csb0_reg && !web0_reg ) begin
        if (wmask0_reg[0])
                mem[addr0_reg][7:0] = din0_reg[7:0];
        if (wmask0_reg[1])
                mem[addr0_reg][15:8] = din0_reg[15:8];
        if (wmask0_reg[2])
                mem[addr0_reg][23:16] = din0_reg[23:16];
        if (wmask0_reg[3])
                mem[addr0_reg][31:24] = din0_reg[31:24];
    end
  end

  // Memory Read Block Port 0
  // Read Operation : When web0 = 1, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_READ0
    if (!csb0_reg && web0_reg)
       dout0 <= #(DELAY) mem[addr0_reg];
  end

  // Memory Read Block Port 1
  // Read Operation : When web1 = 1, csb1 = 0
  always @ (negedge clk1)
  begin : MEM_READ1
    if (!csb1_reg)
       dout1 <= #(DELAY) mem[addr1_reg];
  end

endmodule


// OpenRAM SRAM model
// Words: 512
// Word size: 32
// Write size: 8

 module sky130_sram_1kbyte_1rw1r_32x256_8_data(
 `ifdef USE_POWER_PINS
     vccd1,
     vssd1,
 `endif
 // Port 0: RW
     clk0,csb0,web0,wmask0,addr0,din0,dout0,
 // Port 1: R
     clk1,csb1,addr1,dout1
   );

   parameter NUM_WMASKS = 4 ;
   parameter DATA_WIDTH = 32 ;
   parameter ADDR_WIDTH = 8 ;
   parameter RAM_DEPTH = 1 << ADDR_WIDTH;
   // FIXME: This delay is arbitrary.
   parameter DELAY = 0 ;
   parameter VERBOSE = 0 ; //Set to 0 to only display warnings
   parameter T_HOLD = 0 ; //Delay to hold dout value after posedge. Value is arbitrary

 `ifdef USE_POWER_PINS
     inout vccd1;
     inout vssd1;
 `endif
   input  clk0; // clock
   input   csb0; // active low chip select
   input  web0; // active low write control
   input [NUM_WMASKS-1:0]   wmask0; // write mask
   input [ADDR_WIDTH-1:0]  addr0;
   input [DATA_WIDTH-1:0]  din0;
   output [DATA_WIDTH-1:0] dout0;
   input  clk1; // clock
   input   csb1; // active low chip select
   input [ADDR_WIDTH-1:0]  addr1;
   output [DATA_WIDTH-1:0] dout1;

   reg  csb0_reg;
   reg  web0_reg;
   reg [NUM_WMASKS-1:0]   wmask0_reg;
   reg [ADDR_WIDTH-1:0]  addr0_reg;
   reg [DATA_WIDTH-1:0]  din0_reg;
   reg [DATA_WIDTH-1:0]  dout0;

   // All inputs are registers
   always @(posedge clk0)
   begin
     csb0_reg = csb0;
     web0_reg = web0;
     wmask0_reg = wmask0;
     addr0_reg = addr0;
     din0_reg = din0;
     #(T_HOLD) dout0 = 32'bx;
     if ( !csb0_reg && web0_reg && VERBOSE ) 
       $display($time," Reading %m addr0=%b dout0=%b",addr0_reg,mem[addr0_reg]);
     if ( !csb0_reg && !web0_reg && VERBOSE )
       $display($time," Writing %m addr0=%b din0=%b wmask0=%b",addr0_reg,din0_reg,wmask0_reg);
   end

  reg  csb1_reg;
   reg [ADDR_WIDTH-1:0]  addr1_reg;
   reg [DATA_WIDTH-1:0]  dout1;

   // All inputs are registers
   always @(posedge clk1)
   begin
     csb1_reg = csb1;
     addr1_reg = addr1;
     if (!csb0 && !web0 && !csb1 && (addr0 == addr1))
          $display($time," WARNING: Writing and reading addr0=%b and addr1=%b simultaneously!",addr0,addr1);
     #(T_HOLD) dout1 = 32'bx;
     if ( !csb1_reg && VERBOSE ) 
       $display($time," Reading %m addr1=%b dout1=%b",addr1_reg,mem[addr1_reg]);
   end

 reg [DATA_WIDTH-1:0]    mem [0:RAM_DEPTH-1];

   // Memory Write Block Port 0
   // Write Operation : When web0 = 0, csb0 = 0
   always @ (negedge clk0)
   begin : MEM_WRITE0
     if ( !csb0_reg && !web0_reg ) begin
         if (wmask0_reg[0])
                 mem[addr0_reg][7:0] = din0_reg[7:0];
         if (wmask0_reg[1])
                 mem[addr0_reg][15:8] = din0_reg[15:8];
         if (wmask0_reg[2])
                 mem[addr0_reg][23:16] = din0_reg[23:16];
         if (wmask0_reg[3])
                 mem[addr0_reg][31:24] = din0_reg[31:24];
     end
   end

   // Memory Read Block Port 0
   // Read Operation : When web0 = 1, csb0 = 0
   always @ (negedge clk0)
   begin : MEM_READ0
     if (!csb0_reg && web0_reg)
        dout0 <= #(DELAY) mem[addr0_reg];
   end

   // Memory Read Block Port 1
   // Read Operation : When web1 = 1, csb1 = 0
   always @ (negedge clk1)
   begin : MEM_READ1
     if (!csb1_reg)
        dout1 <= #(DELAY) mem[addr1_reg];
   end

 endmodule
