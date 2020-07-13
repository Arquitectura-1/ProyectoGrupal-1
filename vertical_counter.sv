module vertical_counter(
	input clk,
	input enable_V_Counter,
	output reg[9:0] V_Count_Value = 0
);
	always@(posedge clk) begin
		if(enable_V_Counter == 1'b1) begin
			if(V_Count_Value < 658 && enable_V_Counter == 1'b1) begin
				V_Count_Value <= V_Count_Value +1;
			end
			else begin
				V_Count_Value <= 1'b0;
			end
		end	
	end
endmodule 