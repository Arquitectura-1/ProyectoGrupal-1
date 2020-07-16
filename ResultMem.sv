module ResultMem(
input  clk,
input  [9:0] H_Count_Value,
input  [9:0] V_Count_Value,
output logic [7:0] R,
output logic [7:0] G,
output logic [7:0] B
);
	
	logic [18:0] contadorDir = 0; 
	logic [7:0] Result;
	Data_MemVGA datos (.Addr(contadorDir), .Result(Result));
	
	
	always@(posedge clk) begin
		if(H_Count_Value <= 479 && V_Count_Value <= 639) begin
				R = Result;
				G = Result;
				B = Result;
				contadorDir <= contadorDir + 1;
		end
		else begin
				R = 8'bx;
				G = 8'bx;
				B = 8'bx;
		end
	end
	

endmodule 