module horizontal_counter(
	input clk,
	output reg enable_V_Counter = 0,
	output reg [9:0] H_Count_Value = 0
);


	always@(posedge clk) begin
		if(H_Count_Value < 639) begin
			H_Count_Value <= H_Count_Value + 1;
			enable_V_Counter <= 0;
		end
		else begin
			H_Count_Value <= 0;
			enable_V_Counter <= 1;
		end
	
	end


endmodule 