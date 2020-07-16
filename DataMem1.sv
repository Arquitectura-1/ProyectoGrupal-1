module DataMem1(
input logic [18:0] address,
output logic [7:0] result = 0
);
	reg [7:0] DataMemory [0:102399];

	
	initial begin
		$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\Pixel1.txt", DataMemory);
	end
	
	
	always @(address) begin
		result = DataMemory[address];
	end


endmodule 