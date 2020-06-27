module MEM (input logic [6:0] RdOut, branchResult, input logic [31:0] AluResult, input logic [4:0] OpCode,output logic [31:0] Result,output logic [6:0] RdWb,output logic Wrenable,output logic [6:0] BranchResultOut);

int Addr;
int pixCounter=0;
int memCounter=0;

//Memorias que contienen la imagen inicial
reg [7:0] DataMemory1 [0:64999];
reg [7:0] DataMemory2 [0:64999];
reg [7:0] DataMemory3 [0:64999];
reg [7:0] DataMemory4 [0:64999];
reg [7:0] DataMemory5 [0:64999];
reg [7:0] DataMemory6 [0:64999];
reg [7:0] DataMemory7 [0:64999];
reg [7:0] DataMemory8 [0:64999];
reg [7:0] DataMemory9 [0:64999];
reg [7:0] DataMemory10 [0:29391];


//Memorias donde se guardan los valores finales
reg [7:0] OutMemory1 [0:65000];



initial begin
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel1.txt", DataMemory1);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel2.txt", DataMemory2);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel3.txt", DataMemory3);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel4.txt", DataMemory4);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel5.txt", DataMemory5);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel6.txt", DataMemory6);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel7.txt", DataMemory7);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel8.txt", DataMemory8);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel9.txt", DataMemory9);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel10.txt", DataMemory10);
end

always @(OpCode) begin
	$display(OpCode);
	
	if(OpCode == 0) begin 
	$display("Entro nop");
		Result = 32'd0;
		RdWb = 0; 
		Wrenable = 0;
		BranchResultOut= 0000000;
	end
	
	//LV
	else if (OpCode == 1) begin
	$display("Entro lv");
		Result = AluResult;
		RdWb = RdOut; 
		Wrenable = 1;
		BranchResultOut= 0000000;
	end
	
	//suma,resta, mul y div
	else if (OpCode >= 2 && OpCode <= 5) begin
	$display("Entro entro sum");
		Result = AluResult;
		RdWb = RdOut; 
		Wrenable = 1;
		BranchResultOut= 0000000;
	end
	
	//CP
	else if(OpCode == 6) begin
	$display("Entro cp");
		Addr = AluResult;
		RdWb = RdOut;
		BranchResultOut = branchResult;
		Wrenable =1;
		if(Addr <65000)
			Result = DataMemory1[Addr];
		else if(Addr < 130000)
			Result = DataMemory2[Addr];
		else if(Addr < 195000)
			Result = DataMemory3[Addr];
		else if(Addr < 260000)
			Result = DataMemory4[Addr];
		else if(Addr < 325000)
			Result = DataMemory5[Addr];
		else if(Addr < 390000)
			Result = DataMemory6[Addr];
		else if(Addr < 455000)
			Result = DataMemory7[Addr];
		else if(Addr< 520000) 
			Result = DataMemory8[Addr];
		else if(Addr < 585000)
			Result = DataMemory9[Addr];
		else
			Result = DataMemory10[Addr];
	end 
	
	//B
	else if (OpCode == 7) begin
		$display("Entro B");
		BranchResultOut <= branchResult;
		Result = 32'd0;
		RdWb = 6'd0; 
		Wrenable = 0;
	end
	
	//Beg
	else if (OpCode == 8) begin
	$display("Entro Beg");
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
	
	//slr
	else if (OpCode == 9) begin
	$display("Entro slr");
		Result = AluResult;
		RdWb = RdOut; 
		Wrenable = 1;
		BranchResultOut= 0000000;
	end
	
	//GP
	else if (OpCode == 10) begin
	$display("Entro gp");
		RdWb = 0;
		BranchResultOut = 0;
		Wrenable =0;
		
		if (pixCounter > 304200) begin
			pixCounter =0;
			$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\OutMemory1.txt",OutMemory1);
		end
		else begin
			OutMemory1[pixCounter]=AluResult[31:0];
			pixCounter = pixCounter +1;
			memCounter = memCounter +1;
			$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\OutMemory1.txt",OutMemory1);
		end
	end
	
end

endmodule
		

	
 