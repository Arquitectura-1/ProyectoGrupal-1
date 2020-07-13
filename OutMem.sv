module OutMem (input logic [31:0] Result, input logic enable);

	int pixCounter=0;
	 reg [7:0] OutMemory1 [0:10];

		always@(Result, enable)
			if(enable ==1) begin
				if (pixCounter < 9) begin
					OutMemory1[pixCounter]=Result[31:0];
					pixCounter = pixCounter +1;
				end
				else begin
					OutMemory1[pixCounter]=Result[31:0];
					pixCounter = pixCounter +1;
					$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\OutMemory1.txt",OutMemory1);
				end
			end
			else begin
			end
				
endmodule 