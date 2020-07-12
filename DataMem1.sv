module DataMem1(
input logic [18:0] address,
output logic [7:0] result = 0
);
	reg [7:0] DataMemory [0:153599];

	
	initial begin
		$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel1.txt", DataMemory);
	end
	
	
	always @(address) begin
		result = DataMemory[address];
	end


endmodule 