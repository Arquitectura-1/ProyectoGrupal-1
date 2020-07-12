module Data_Mem_tb();
logic [18:0] Addr;
logic [7:0] Result;


Data_Mem DUT(Addr, Result);

initial begin 

Addr = 19'd0;
#10;
Addr = 19'd153600;
#10;
Addr = 19'd153601;
#10;
Addr = 19'd307199;
#10;
end


endmodule 