module vga (
	input logic clk,
	output Hsync,
	output Vsync,
	output [7:0] R,
	output [7:0] G,
	output [7:0] B,
	output Hsync320,
	output Vsync320,
	output [7:0] R320,
	output [7:0] G320,
	output [7:0] B320,
	output DONE,
	output logic DONE640
);	

	logic flag;
	logic clk640;
	logic clk320;
	
	vga480x640 vga640 (.clk(clk640), .Hsync(Hsync), .Vsync(Vsync), .R(R), .G(G), .B(B), .DONE(flag));
	vga480x320 vga320 (.clk(clk320), .Hsync(Hsync320), .Vsync(Vsync320), .R(R320), .G(G320), .B(B320), .DONE(DONE),.Done640(flag));
	
	always@(clk)begin
		if(flag == 0)begin
			clk640 = clk;
			clk320 = 0;
			DONE640 = flag;
		end
		else begin
			clk640 = 0;
			clk320 = clk;
			DONE640 = flag;
		end
	end


endmodule 