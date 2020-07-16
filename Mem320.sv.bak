module Mem320(
input logic [17:0] address,
output logic [7:0] result
);

	reg [7:0] PixMem [0:153599];

	initial begin
	$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\OutMemory1 (1).txt", PixMem);
	end

	always @(address) begin
		result = PixMem[address];
	end
endmodule 