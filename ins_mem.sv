module ins_mem(input logic [31:0] addr, output logic [31:0] ins);

reg [31:0] InsMem [0:42];

initial begin
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\CodigoBin.txt", InsMem);
end

always @(addr) begin
	ins = InsMem[addr];
end


endmodule 