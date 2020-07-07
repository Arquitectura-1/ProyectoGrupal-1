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
	
	
	vga vgaTop (.clk(clk), .Hsync(Hsync), .Vsync(Vsync), .R(R), .G(G), .B(B), 
	.Hsync320(Hsync320), .Vsync320(Vsync320), .R320(R320), .G320(G320), .B320(B320), .DONE(DONE320), .DONE640(DONE));
	 
	always 
	#5
	clk = ~clk;
	 
	always@(posedge clk) begin
		if(DONE320 == 1) begin
			$fclose(f);
			$fclose(F);
			$stop;
			$finish; 
		end
		else if(DONE != 1) begin
			$fwrite(f,"%b %b %b %b %b %b\n",counter, Hsync, Vsync, R, G, B);
		end
		else begin
			$fwrite(F,"%b %b %b %b %b %b\n",counter, Hsync320, Vsync320, R320, G320, B320);
		end
		counter = counter+1;
	end
	initial begin
	clk = 0;
	f = $fopen("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Encriptado.img","w");
	F = $fopen("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Desencriptado.img","w");
	end



endmodule 