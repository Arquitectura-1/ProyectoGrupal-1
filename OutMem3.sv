module OutMem3 (input logic [31:0] Result, input logic enable);

	int pixCounter=0;
	reg [7:0] OutMemory3 [0:3333];

		always@(Result, enable)
			if(enable ==1) begin
				if (pixCounter < 3333) begin
					OutMemory3[pixCounter]=Result[31:0];
					pixCounter = pixCounter +1;
				end
				else begin
					$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\OutMemory3.txt",OutMemory3);
				end
			end
			else begin
			end
				
endmodule 