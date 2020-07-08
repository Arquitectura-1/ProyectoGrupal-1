
module Memoria_Procesador(input [6:0] branchResultOut,input logic clk,output logic [31:0] Instruccion, output logic Done=0);

reg [6:0] pc=7'd0;
reg valor_inicial=1; 

reg [31:0] InsMem [0:100];

reg [4:0] opcode;




initial begin
	$readmemb("C:\\Users\\Gaby\\Desktop\\ProyectoGrupal-1-Procesador\\CodigoBin.txt", InsMem);
end




always@(posedge clk)
begin
			if (branchResultOut==0000000 || branchResultOut === 7'bx) begin
				pc <= pc + 7'b0000001;
				opcode = InsMem[pc][31:27];
				if(opcode != 5'b01011) begin
					Instruccion <= InsMem[pc];
					Done <= 1'b0;
				end
				else begin
					Done <= 1'b1;
				end
			end
			else begin
				pc <= branchResultOut;
				opcode = InsMem[pc][31:27];
				if(opcode != 5'b01011) begin
					Instruccion <= InsMem[pc];
					Done <= 1'b0;
				end
				else begin
					Done <= 1'b1;
				end
					
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

