`timescale 1 ps / 1 ps
module vga_tb();

	logic clk;
	logic Hsync, Hsync320;
	logic Vsync, Vsync320;
	logic [7:0] R, R320;
	logic [7:0] G, G320;
	logic [7:0] B, B320;
	logic DONE,	DONE320;
	integer f, F;
	
	int counter = 0;
	parameter n1 = 1;
	parameter n2 = 2;

	logic clock=0;
	logic vgaClock =0;
	logic vgaDone;

	logic done  =0;
	logic done2 =0;

	
	CPU #(n1) DUT1 (clock, done);
	CPU #(n2) DUT2 (clock, done2);

	//ASIP asip1 (.clock(clock), .vgaclock(vgaClock),.Hsync(Hsync), .Vsync(Vsync),.Hsync320(Hsync320), .Vsync320(Vsync320),.DONE(DONE320),	.DONE640(DONE), .done(done), .done2(done2), .R320(R320), .G320(G320), .B320(B320), .R(R), .G(G), .B(B));
always#5
	if(done != 1 && done2 !=1 )
		clock = ~clock;
	else if(done == 1) begin
		clock = 0;
		vgaClock = ~vgaClock;
	end
	
always @(posedge vgaClock) begin
	if(DONE320 == 1) begin
				$fclose(f);
				$fclose(F);
				$stop;
				$finish; 
			end
			else if(DONE != 1) begin
				$fwrite(f,"%b %b %b %b %b %b\n",counter, Hsync, Vsync, R, G, B);
			end
			else if (DONE ==1) begin
				$fwrite(F,"%b %b %b %b %b %b\n",counter, Hsync320, Vsync320, R320, G320, B320);
			end
			counter = counter+1;
end
	
	vga vgaTop (.clk(vgaClock), .Hsync(Hsync), .Vsync(Vsync), .R(R), .G(G), .B(B), 
	.Hsync320(Hsync320), .Vsync320(Vsync320), .R320(R320), .G320(G320), .B320(B320), .DONE(DONE320), .DONE640(DONE));
	

	initial begin
	clk = 0;
	f = $fopen("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\Encriptado.img","w");
	F = $fopen("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\Desencriptado.img","w");
	end



endmodule 