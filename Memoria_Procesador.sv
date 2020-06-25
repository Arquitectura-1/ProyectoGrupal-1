module Memoria_Procesador(input [6:0] branchResultOut,input logic clk,output logic [31:0] Instruccion);

reg [6:0] pc=7'd0;
reg valor_inicial=1; 

reg [31:0] InsMem [0:70];



initial begin
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\CodigoBin.txt", InsMem);
end

always@(posedge clk)
begin
			if (branchResultOut==0000000 || branchResultOut === 7'bx) begin
				pc <= pc + 7'b0000001;
				Instruccion <= InsMem[pc];
			end
			else begin
				pc <= branchResultOut;
				Instruccion <= InsMem[pc];
		end	
end


/*
Memoria_Instrucciones Instrucciones(
	.address(pc),
	.clock(clk),
	.data(data),
	.wren(0),
	.q(Instruccion)); 


Memoria_prueba Instrucciones (
	.address(pc),
	.clock(clk),
	.q(Instruccion));
*/
endmodule

