
module MEM (input logic [6:0] RdOut, branchResult, input logic [31:0] AluResult, input logic [4:0] OpCode,output logic [31:0] Result,output logic [6:0] RdWb,output logic Wrenable,output logic [6:0] BranchResultOut);

logic [19:0] Addr;
int pixCounter=0;

reg [31:0] tmpResult=32'b0;

//Memorias donde se guardan los valores finales
reg [7:0] OutMemory1 [0:153600];


Data_Mem dMem (Addr,Result);


always @(OpCode) begin
	//$display(OpCode);
	
	if(OpCode == 0) begin 
	//$display("Entro nop");
		BranchResultOut= 0000000;
	end
	
	//LV
	else if (OpCode == 1) begin
	//$display("Entro lv");
		BranchResultOut= 0000000;
	end
	
	//suma,resta, mul y div
	else if (OpCode >= 2 && OpCode <= 5) begin
	//$display("Entro entro sum");
		BranchResultOut= 0000000;
	end
	
	//CP
	else if(OpCode == 6) begin
	//$display("Entro cp");
		Addr <= AluResult;
		RdWb <= RdOut;
		//BranchResultOut <= branchResult;
		BranchResultOut= 0000000;
		Wrenable <=1;
		Result[31:0] <= tmpResult[31:0] ;
	end 
	/*
	//B
	else if (OpCode == 7) begin
		//$display("Entro B");
		BranchResultOut <= branchResult;
		Result = 32'd0;
		RdWb = 6'd0; 
		Wrenable = 0;
	end
	
	
	//Beg
	else if (OpCode == 8) begin
	//$display("Entro Beg");
		if (AluResult == 1) begin
			Result = 32'd0;
			RdWb = 6'd0; 
			Wrenable = 0;
			BranchResultOut= branchResult;
		end
		else begin
			Result = 32'd0;
			RdWb = 6'd0; 
			Wrenable = 0;
			BranchResultOut= 0000000;
		end
	end
	*/
	
	
	//slr
	else if (OpCode == 9) begin
	//$display("Entro slr");
		BranchResultOut= 0000000;
	end
	
	//GP
	else if (OpCode == 10) begin
	//$display("Entro gp");
		BranchResultOut= 0000000;
		
		if (pixCounter < 153600) begin
			OutMemory1[pixCounter]=AluResult[31:0];
			pixCounter = pixCounter +1;
			
		end
		else begin
			$writememb("C:\\Users\\Gaby\\Desktop\\ProyectoGrupal-1-Procesador_2\\OutMemory1.txt",OutMemory1);
		end
	end
end




endmodule
		

	
 