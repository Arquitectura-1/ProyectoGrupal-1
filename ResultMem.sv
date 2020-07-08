module ResultMem(
input  clk,
input  [9:0] H_Count_Value,
input  [9:0] V_Count_Value,
output logic [7:0] R,
output logic [7:0] G,
output logic [7:0] B
);
	
//	reg [7:0] PixMem1 [0:64999];
//	reg [7:0] PixMem2 [0:64999];
//	reg [7:0] PixMem3 [0:64999];
//	reg [7:0] PixMem4 [0:64999];
//	reg [7:0] PixMem5 [0:47199];

	
//	initial begin
//	$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel1.txt", PixMem1);
//	$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel2.txt", PixMem2);
//	$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel3.txt", PixMem3);
//	$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel4.txt", PixMem4);
//	$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel5.txt", PixMem5);
//	end
	logic [18:0] contadorDir = 0; 
	logic [31:0] Result;
	Data_Mem datos (.Addr(contadorDir), .Result(Result));
	
	
	always@(posedge clk) begin
		if(H_Count_Value <= 479 && V_Count_Value <= 639) begin
				R = Result[7:0];
				G = Result[7:0];
				B = Result[7:0];
				contadorDir <= contadorDir + 1;
		end
		else begin
				R = 8'bx;
				G = 8'bx;
				B = 8'bx;
		end
	end
	

endmodule 