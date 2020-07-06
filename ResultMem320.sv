module ResultMem320(
input  clk,
input  [9:0] H_Count_Value,
input  [9:0] V_Count_Value,
output logic [7:0] R,
output logic [7:0] G,
output logic [7:0] B
);

	
	reg [7:0] PixMem1 [0:153599];


	
	initial begin
	$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\OutMemory1.txt", PixMem1);
	end
	logic [18:0] contadorDir = 0;
	
	
	always@(posedge clk) begin
		if(H_Count_Value <= 479 && V_Count_Value <= 319) begin
				R = PixMem1[contadorDir];
				G = PixMem1[contadorDir];
				B = PixMem1[contadorDir];
				contadorDir <= contadorDir + 1;
		end
		else begin
				R = 8'bx;
				G = 8'bx;
				B = 8'bx;
		end
	end



endmodule 