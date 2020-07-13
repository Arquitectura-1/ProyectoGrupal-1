
module Memoria_Procesador(input [31:0] branchResultOut,input logic clk,output logic [31:0] Instruccion, output logic Done=0);

reg [31:0] pc=32'd0;
reg valor_inicial=1; 

reg [31:0] InsMem [0:6100];

reg [4:0] opcode;

wire [31:0] tmpIns;


initial begin
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\CodigoBin.txt", InsMem);
end




always@(posedge clk)
begin
			if (branchResultOut==00000000000000000000000000000000 || branchResultOut === 32'bx) begin
				pc <= pc + 32'b0000000000000000000000000000001;
				opcode = InsMem[pc][31:27];
				if(opcode != 5'b01011) begin
					Instruccion[31:0] = InsMem[pc];
					Done <= 1'b0;
				end
				else begin
					Done <= 1'b1;
				end
			end
			else begin
				pc <= branchResultOut;
				//opcode = InsMem[pc][31:27];
				if(opcode != 5'b01011) begin
					Instruccion <= InsMem[pc];
					Done <= 1'b0;
				end
				else begin
					Done <= 1'b1;
				end
					
		end
end


endmodule

