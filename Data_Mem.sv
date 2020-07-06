module Data_Mem(input logic [18:0] Addr, output logic [31:0] Result);


//Memorias que contienen la imagen inicial
reg [7:0] DataMemory1 [0:64999];
reg [7:0] DataMemory2 [0:64999];
reg [7:0] DataMemory3 [0:64999];
reg [7:0] DataMemory4 [0:64999];
reg [7:0] DataMemory5 [0:47199];

	initial begin
		$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel1.txt", DataMemory1);
		$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel2.txt", DataMemory2);
		$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel3.txt", DataMemory3);
		$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel4.txt", DataMemory4);
		$readmemb("C:\\Users\\allan\\Desktop\\TEC\\I Semestre 2020\\Arqutectura de Computadores\\Proyecto2\\VGA\\Pixel5.txt", DataMemory5);
	end
	
	
	always@(Addr)
		if(Addr <65000)
			Result = DataMemory1[Addr];
		else if(Addr < 130000)
			Result = DataMemory2[Addr-65000];
		else if(Addr < 195000)
			Result = DataMemory3[Addr-130000];
		else if(Addr < 260000)
			Result = DataMemory4[Addr-195000];
		else
			Result = DataMemory5[Addr-260000];
	
endmodule 