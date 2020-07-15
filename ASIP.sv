module ASIP (input logic clock, vgaclock, output logic Hsync, Vsync,Hsync320, Vsync320,DONE,	DONE640, done, done2, output logic [7:0] R320, G320, B320, R, G, B);

	parameter n1 = 1;
	parameter n2 = 2;
	logic [7:0] r,g,b,r320,g320,b320;
	logic hsync, hsync320, vsync, vsync320, done320, donecpu, done640, donecpu2;
	
	assign done = donecpu;
	assign done2 = donecpu2;
	
	CPU #(n1) DUT1 (clock, donecpu);
	CPU #(n2) DUT2 (clock, donecpu2);	
	
	assign R320 = r320;
	assign B320 = b320;
	assign G320 = g320;
	assign R = r;
	assign B = b;
	assign G = g;
	assign Hsync = hsync;
	assign Hsync320 = hsync320;
	assign Vsync = vsync;
	assign Vsync320 = vsync320;
	assign DONE = done320;
	assign DONE640 = done640;

	
	vga vgaTop (.clk(vgaClock), .Hsync(hsync), .Vsync(vsync), .R(r), .G(g), .B(b), 
	.Hsync320(hsync320), .Vsync320(vsync320), .R320(r320), .G320(g320), .B320(b320), .DONE(done320), .DONE640(done640));

endmodule 