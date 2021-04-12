module mux21(q,sel,w);
	input wire sel;
	input wire [0:1]w;
	output wire q;
	assign q=sel?w[1]:w[0];
endmodule

module mux41(q,sel,w);
	input wire [1:0]sel;
	input wire [0:3]w;
	output wire q;
	wire [1:2]i;
	mux21 m1(i[1],sel[0],w[0:1]);
	mux21 m2(i[2],sel[0],w[2:3]);
	mux21 m3(q,sel[1],i);
endmodule

module mux161(q,sel,w);
	input wire [0:15]w;
	input wire [3:0]sel;
	output wire q;
	wire [0:3]i;
	mux41 mux0(i[0],sel[1:0],w[0:3]);
	mux41 mux1(i[1],sel[1:0],w[4:7]);
	mux41 mux2(i[2],sel[1:0],w[8:11]);
	mux41 mux3(i[3],sel[1:0],w[12:15]);
	mux41 mux4(q,sel[3:2],i);
endmodule

