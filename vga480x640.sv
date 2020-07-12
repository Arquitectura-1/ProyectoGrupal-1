module vga480x640(
	input clk,
	output Hsync,
	output Vsync,
	output logic [7:0] R,
	output logic [7:0] G,
	output logic [7:0] B,
	output logic DONE =0
);

	wire [9:0] H_Count_Value;
	wire [9:0] V_Count_Value;
	vga_controller vga(.clk(clk), .Hsync(Hsync), .Vsync(Vsync), .H_Count_Value(H_Count_Value), .V_Count_Value(V_Count_Value));
	ResultMem mem(.clk(clk), .H_Count_Value(H_Count_Value), .V_Count_Value(V_Count_Value), .R(R), .G(G), .B(B));
	
	always@(posedge clk) begin
		if(V_Count_Value == 658 && H_Count_Value == 639 ) begin
			DONE <= 1;
		end
	end



endmodule 