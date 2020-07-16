module Data_MemVGA(input logic [18:0] Addr, output logic [7:0] Result);


	logic [7:0] result1, result2;
//Memorias que contienen la imagen inicial
	DataMem1 mem1 (.address(Addr), .result(result1));
	DataMem2 mem2 (.address(Addr), .result(result2));
	
	assign Result = (Addr <= 102399) ? result1 : result2;
	
endmodule 