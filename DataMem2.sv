module DataMem2(
input logic [18:0] address,
output logic [7:0] result = 0
);
	reg [7:0] DataMemory [0:153599];

	
	initial begin
		$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\Pixel2.txt", DataMemory);
	end
	
	
	always @(address) begin
		result = DataMemory[address-153600];
	end


endmodule 