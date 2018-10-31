module priorityThirtyTwo(
	input [31:0] a,
	output [4:0] out
	);
	
	always@(a)
	begin
	if(a[31]==1)
		out=5'b11111;
	else if(a[30]==1)
		out=5'b11110;
	else if(a[29]==1)
		out=5'b11101;
	else if(a[28]==1)
		out=5'b11100;
	else if(a[27]==1)
		out=5'b11011;
	else if(a[26]==1)
		out=5'b11010;
	else if(a[25]==1)
		out=5'b11001;
	else if(a[24]==1)
		out=5'b11000;
	else if(a[23]==1)
		out=5'b10111;
	else if(a[22]==1)
		out=5'b10110;
	else if(a[21]==1)
		out=5'b10101;
	else if(a[20]==1)
		out=5'b10100;
	else if(a[19]==1)
		out=5'b10011;
	else if(a[18]==1)
		out=5'b10010;
	else if(a[17]==1)
		out=5'b10001;
	else if(a[16]==1)
		out=5'b10000;
	else if(a[15]==1)
		out=5'b01111;
	else if(a[14]==1)
		out=5'b01110;
	else if(a[13]==1)
		out=5'b01101;
	else if(a[12]==1)
		out=5'b01100;
	else if(a[11]==1)
		out=5'b01011;
	else if(a[10]==1)
		out=5'b01010;
	else if(a[9]==1)
		out=5'b01001;
	else if(a[8]==1)
		out=5'b01000;
	else if(a[7]==1)
		out=5'b00111;
	else if(a[6]==1)
		out=5'b00110;
	else if(a[5]==1)
		out=5'b00101;
	else if(a[4]==1)
		out=5'b00100;
	else if(a[3]==1)
		out=5'b00011;
	else if(a[2]==1)
		out=5'b00010;
	else if(a[1]==1)
		out=5'b00001;
	else if(a[0]==1)
		out=5'b00000;
	end
endmodule

module decoderThirtyTwo(
	input [4:0] a,
	output [31:0] out
	);
	
	always@(a)
	begin
		if(a == 0)
			out = 32'b0000000000000000000000000000000;
		else if(a == 1)
			out = 32'b0000000000000000000000000000001;
		else if(a == 2)
			out = 32'b0000000000000000000000000000010;
		else if(a == 3)
			out = 32'b0000000000000000000000000000100;
		else if(a == 4)
			out = 32'b0000000000000000000000000001000;
		else if(a == 5)
			out = 32'b0000000000000000000000000010000;
		else if(a == 6)
			out = 32'b0000000000000000000000000100000;
		else if(a == 7)
			out = 32'b0000000000000000000000001000000;
		else if(a == 8)
			out = 32'b0000000000000000000000010000000;
		else if(a == 9)
			out = 32'b0000000000000000000000100000000;
		else if(a == 10)
			out = 32'b0000000000000000000001000000000;
		else if(a == 11)
			out = 32'b0000000000000000000010000000000;
		else if(a == 12)
			out = 32'b0000000000000000000100000000000;
		else if(a == 13)
			out = 32'b0000000000000000001000000000000;
		else if(a == 14)
			out = 32'b0000000000000000010000000000000;
		else if(a == 15)
			out = 32'b0000000000000000100000000000000;
		else if(a == 16)
			out = 32'b0000000000000001000000000000000;
		else if(a == 17)
			out = 32'b0000000000000010000000000000000;
		else if(a == 18)
			out = 32'b0000000000000100000000000000000;
		else if(a == 19)
			out = 32'b0000000000001000000000000000000;
		else if(a == 20)
			out = 32'b0000000000010000000000000000000;
		else if(a == 21)
			out = 32'b0000000000100000000000000000000;
		else if(a == 22)
			out = 32'b0000000001000000000000000000000;
		else if(a == 23)
			out = 32'b0000000010000000000000000000000;
		else if(a == 24)
			out = 32'b0000000100000000000000000000000;
		else if(a == 25)
			out = 32'b0000001000000000000000000000000;
		else if(a == 26)
			out = 32'b0000010000000000000000000000000;
		else if(a == 27)
			out = 32'b0000100000000000000000000000000;
		else if(a == 28)
			out = 32'b0001000000000000000000000000000;
		else if(a == 29)
			out = 32'b0010000000000000000000000000000;
		else if(a == 30)
			out = 32'b0100000000000000000000000000000;
		else if(a == 31)
			out = 32'b1000000000000000000000000000000;

	end	

endmodule

module custom(
	input dist1[31:0],
	input dist0[31:0],
	input amt1[31:0],
	input amt0[31:0],
	output reg out1[31:0],
	output reg out2[31:0]
	);
	reg [1:0] a;
	reg [1:0] b;
	integer i;
	always@(dist1 or dist0)
	begin
		a[1] = dist1[0]; a[0] = dist0[0];
		assign i = 0;
		
		b[1] = dist1[1]; a[0] = dist0[1];
 		if(a > b)
 		begin
 			i = 2;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[2]; a[0] = dist0[2];
 		if(a > b)
 		begin
 			i = 2;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[3]; a[0] = dist0[3];
 		if(a > b)
 		begin
 			i = 3;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[4]; a[0] = dist0[4];
 		if(a > b)
 		begin
 			i = 4;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[5]; a[0] = dist0[5];
 		if(a > b)
 		begin
 			i = 5;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[6]; a[0] = dist0[6];
 		if(a > b)
 		begin
 			i = 6;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[7]; a[0] = dist0[7];
 		if(a > b)
 		begin
 			i = 7;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[8]; a[0] = dist0[8];
 		if(a > b)
 		begin
 			i = 8;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[9]; a[0] = dist0[9];
 		if(a > b)
 		begin
			i = 9;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[10]; a[0] = dist0[10];
 		if(a > b)
 		begin
 			i = 10;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[11]; a[0] = dist0[11];
 		if(a > b)
 		begin
 			i = 11;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[12]; a[0] = dist0[12];
 		if(a > b)
 		begin
 			i = 12;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[13]; a[0] = dist0[13];
 		if(a > b)
 		begin
 			i = 13;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[14]; a[0] = dist0[14];
 		if(a > b)
 		begin
 			i = 14;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[15]; a[0] = dist0[15];
 		if(a > b)
 		begin
 			i = 15;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[16]; a[0] = dist0[16];
 		if(a > b)
 		begin
 			i = 16;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[17]; a[0] = dist0[17];
 		if(a > b)
 		begin
 			i = 17;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[18]; a[0] = dist0[18];
 		if(a > b)
 		begin
 			i = 18;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[19]; a[0] = dist0[19];
 		if(a > b)
 		begin
 			i = 19;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[20]; a[0] = dist0[20];
 		if(a > b)
 		begin
 			i = 20;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[21]; a[0] = dist0[21];
 		if(a > b)
 		begin
 			i = 21;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[22]; a[0] = dist0[22];
 		if(a > b)
 		begin
 			i = 22;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[23]; a[0] = dist0[23];
 		if(a > b)
 			i = 23;
 		begin
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[24]; a[0] = dist0[24];
 		if(a > b)
 		begin
 			i = 24;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[25]; a[0] = dist0[25];
 		if(a > b)
 		begin
 			i = 25;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[26]; a[0] = dist0[26];
 		if(a > b)
 		begin
 			i = 26;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[27]; a[0] = dist0[27];
 		if(a > b)
 		begin
 			i = 27;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[28]; a[0] = dist0[28];
 		if(a > b)
 		begin
 			i = 28;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[29]; a[0] = dist0[29];
 		if(a > b)
 		begin
 			i = 29;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[30]; a[0] = dist0[30];
 		if(a > b)
 		begin
 			i = 30;
 			a[1] = b[1];
 			a[0] = b[0];
 		end
 		b[1] = dist1[31]; a[0] = dist0[31];
 		if(a > b)
 		begin
 			i = 31;
 			a[1] = b[1];
 			a[0] = b[0];
 		end	
	end
	
	for (j = 0; j < 32; j= j + 1)
	begin
		if (j==i) 
	    begin
			assign out1[j] = amt1[j];
			assign out0[j] = amt0[j];
		end 
		else
		begin
			assign out1[j] = 0;
			assign out0[j] = 0;
		end
	end
	
endmodule

module giveOutput(
	input store[31:0],
	input amt1[31:0],
	input amt0[31:0],
	output out1[31:0],
	output out0[31:0]
	);
	
	for (i = 0;i < 32;i = i + 1)
	begin
		if(store[i] == 1)
		begin
			assign out0[i] = amt0[i];
			assign out1[i] = amt1[i];
		end
		else
		begin
			assign out0[i] = 1'b0;
			assign out1[i] = 1'b0;
		end		
	end
	
endmodule

module solve (
	input [31:0] u,
	input [31:0] dist1,
	input [31:0] dist0,
	input [31:0] amt1,
	input [31:0] amt0,
	output [31:0] out1,
	output [31:0] out0
	);

	wire [4:0] temp;
	wire v;
	wire [31:0] store;
	
	priorityThirtyTwo ptt(u[31:0], temp[4:0]);

	wire val;
	always@(temp)
	begin
	     val = temp[0]&temp[1]&temp[2]&temp[3];
    end
    
	if (val == 0) 
		custom c(dist1[31:0], dist0[31:0], amt1[31:0], amt0[31:0], out1[31:0], out0[31:0]);
    
	else if(val!=0)
		decoderThirtyTwo dtt(temp[4:0], store[31:0]);
		giveOutput go(store[31:0], amt1[31:0], amt0[31:0], out1[31:0], out0[31:0]);
	end
	
endmodule
