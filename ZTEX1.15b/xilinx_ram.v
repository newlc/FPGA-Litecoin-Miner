// xilinx_ram.v - inferring the ram seems to work fine

module ram # ( parameter ADDRBITS=10 ) (
	address,
	clock,
	data,
	wren,
	q);

	input	[ADDRBITS-1:0]  address;
	input	  clock;
	input	[255:0]  data;
	input	  wren;
	output	[255:0]  q;

	//synthesis attribute ram_style of store is block
	reg [255:0] store [(2 << (ADDRBITS-1))-1:0];
	reg[ADDRBITS-1:0] raddr_reg;
	
	always @ (posedge clock)
	begin
		raddr_reg <= address;
		if (wren)
			store[address] <= data;
	end
	
	assign q = store[raddr_reg];
			
endmodule