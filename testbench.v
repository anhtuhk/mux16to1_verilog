module testbench();
	reg [0:15]w;
	reg [3:0]sel;
	wire q;
	integer i;
	mux161 u1(q,sel,w);
	initial begin
		w<=16'b0101100011101010;
		sel<=4'b0000;
		for (i=0;i<16;i=i+1)
			#10 sel=sel+4'b0001;
		$finish;
	end
	initial begin
		$vcdplusfile("waveform.vpd");
		$vcdpluson();
	end
endmodule
	

