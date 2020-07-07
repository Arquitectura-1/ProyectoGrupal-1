module vga_controller320(
	input  clk, 
	output Hsync,
	output Vsync,
	output [9:0] H_Count_Value,
	output [9:0] V_Count_Value
);

	wire enable_V_Counter;
	
	horizontal_counter vgaHorizontal(.clk(clk), .enable_V_Counter(enable_V_Counter), .H_Count_Value(H_Count_Value));
	vertical_counter320 vgaVertical(.clk(clk), .enable_V_Counter(enable_V_Counter), .V_Count_Value(V_Count_Value));
	assign Hsync = (H_Count_Value >= 527 && H_Count_Value < 559 ) ? 1'b0 : 1'b1;
	assign Vsync = (V_Count_Value >= 322 && V_Count_Value < 332) ? 1'b0 : 1'b1;


endmodule 