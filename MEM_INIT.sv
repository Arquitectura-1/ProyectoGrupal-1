module MEM_INIT #(parameter NAME = "")(input logic [6:0] Addr, output logic [7:0] data);
 
reg [7:0] DataMemory [0:65000];
  initial begin
		if (NAME != "") begin
			$readmemb(NAME, DataMemory);
		end
	end
	
	always @(Addr) begin
		data = DataMemory[Addr];
	end

endmodule 