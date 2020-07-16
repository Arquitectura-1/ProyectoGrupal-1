module outmemory (input logic [31:0] Result, input logic enable );
   int pixCounter=0;
	reg [7:0] OutMemory1 [0:153599];
	reg [7:0] OutMemory2 [0:153599];

		always@(Result, enable)
			if(enable ==1) begin
				if (pixCounter < 76799) begin
					OutMemory1[pixCounter]=Result[31:0];
					pixCounter = pixCounter +1;
				end
				else if (pixCounter < 153599) begin
					OutMemory2[pixCounter]=Result[31:0];
					pixCounter = pixCounter +1;
				end
				else begin
					OutMemory2[pixCounter]=Result[31:0];
					$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\OutMemory1.txt",OutMemory1);
					$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyectoPrueba\\OutMemory2.txt",OutMemory2);
				end
			end
			else begin
			end
endmodule 