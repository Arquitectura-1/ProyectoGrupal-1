module func_modulo (input logic [127:0] pixel, input logic [12:0] n, output logic [127:0] result);
	reg [127:0] aux;
	
	
	always @ (*)begin
		
		if (pixel < n) begin
			result = pixel;
		end
		else begin
			aux = pixel / n ;
			result = pixel - (aux * n);
		end
	end
endmodule
			
	