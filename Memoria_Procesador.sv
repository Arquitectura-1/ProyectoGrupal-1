module Memoria_Procesador(input [6:0] branchResultOut,input logic clk,output logic [31:0] Instruccion);

reg [6:0] pc=0;
reg valor_inicial=1; 

always@(negedge clk)
begin
	if(valor_inicial==1 )
		begin
			pc <= 0000000;
			valor_inicial<=0;
		end
	else
		begin
			if (branchResultOut==0000000)
				pc <= pc + 7'b0000001;
			else
				pc <= branchResultOut;
		end	
end

Memoria_Instrucciones Instrucciones(
	.address(pc),
	.clock(clk),
	.data(data),
	.wren(0),
	.q(Instruccion)); 

endmodule

