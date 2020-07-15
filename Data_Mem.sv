module Data_Mem(input logic [19:0] Addr, output logic [31:0] Result);


//Memorias que contienen la imagen inicial
	reg [7:0] DataMemory1 [0:153600];


	initial begin
		$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\Pixel1.txt", DataMemory1);
	end
	
	
	always@(Addr)
			Result = DataMemory1[Addr];
endmodule 