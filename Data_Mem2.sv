module Data_Mem2(input logic [19:0] Addr, output logic [31:0] Result);


//Memorias que contienen la imagen inicial
reg [7:0] DataMemory2 [0:102400];

	initial begin
		$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\Pixel2.txt", DataMemory2);
	end
	
	
	always@(Addr)
			Result = DataMemory2[Addr];
	
endmodule 