module Data_Mem_tb();
logic [19:0] Addr;
logic [31:0] Result;


Data_Mem DUT(Addr, Result);

initial begin 

Addr = 19'd0;
#10;
Addr = 19'd65000;
#10;
Addr = 19'd130000;
#10;
Addr = 19'd195000;
#10;
Addr = 19'd260000;
#10;

end


endmodule 