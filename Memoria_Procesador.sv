
module Memoria_Procesador(input [31:0] branchResultOut,input logic clk,output logic [31:0] Instruccion, output logic Done=0);

reg [31:0] pc=32'd0;
reg valor_inicial=1; 

//reg [31:0] InsMem [0:42];

reg [4:0] opcode;

reg [31:0] tmpIns;

/*
initial begin
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\CodigoBin.txt", InsMem);
end
*/

ins_mem ins(pc, tmpIns);


always@(posedge clk)
begin
			if (branchResultOut==00000000000000000000000000000000 || branchResultOut === 32'bx) begin
				pc <= pc + 32'b0000000000000000000000000000001;
				opcode = tmpIns[31:27];
				if(opcode != 5'b01011) begin
					Instruccion[31:0] = tmpIns;
					Done <= 1'b0;
				end
				else begin
					Done <= 1'b1;
				end
			end
			else begin
				pc <= branchResultOut;
				opcode = tmpIns[31:27];
				if(opcode != 5'b01011) begin
					Instruccion <= tmpIns;
					Done <= 1'b0;
				end
				else begin
					Done <= 1'b1;
				end
					
		end
end


endmodule

