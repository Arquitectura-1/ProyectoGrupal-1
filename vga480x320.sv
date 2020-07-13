module vga480x320(
	input clk,
	input Done640,
	output Hsync,
	output Vsync,
	output logic [7:0] R,
	output logic [7:0] G,
	output logic [7:0] B,
	output logic DONE
);

	wire [9:0] H_Count_Value;
	wire [9:0] V_Count_Value;
	vga_controller320 vga(.clk(clk), .Hsync(Hsync), .Vsync(Vsync), .H_Count_Value(H_Count_Value), .V_Count_Value(V_Count_Value));
	ResultMem320 mem(.clk(clk), .H_Count_Value(H_Count_Value), .V_Count_Value(V_Count_Value), .R(R), .G(G), .B(B),.Done640(Done640));
	
	always@(posedge clk) begin
		if(V_Count_Value == 338 && H_Count_Value == 639 ) begin
			DONE <= 1;
		end
		else begin
			DONE <= 0;
		end
	end
	
endmodule 