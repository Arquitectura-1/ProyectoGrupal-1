module vga480x640_tb();
	logic clk;
	logic Hsync;
	logic Vsync;
	logic [7:0] R;
	logic [7:0] G;
	logic [7:0] B;
	logic DONE;
	integer f;
	
	vga480x640 vga (.clk(clk), .Hsync(Hsync), .Vsync(Vsync), .R(R), .G(G), .B(B), .DONE(DONE));
	 
	always 
	#5
	clk = ~clk;
	 
	always@(posedge clk) begin
		if(DONE == 1) begin
			$fclose(f);
			$stop;
			$finish;
		end
		else begin
			$fwrite(f,"%b %b %b %b %b %b\n",clk, Hsync, Vsync, R, G, B);
		end
	end
	initial begin
	clk = 0;
	$display("test");
	$display(R);
	f = $fopen("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\Encriptado.img","w");
	end

endmodule 