module Mem320(
input logic [17:0] address,
input logic Done640,
output logic [7:0] result
);

	reg [7:0] PixMem [0:51199];
	reg [7:0] PixMem2 [0:51199];

	always@(Done640)
		begin
			$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\OutMemory1.txt", PixMem);
			$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\OutMemory2.txt", PixMem2);
		end

	always @(address) begin
		if(address <= 51199) begin
			result = PixMem[address];
		end
		else
			result = PixMem2[address-51200];
	end
	
endmodule 