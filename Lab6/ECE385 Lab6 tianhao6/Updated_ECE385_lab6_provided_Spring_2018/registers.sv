module bit16Reg(input logic Clk, Reset, LoadEn,
					  input logic [15:0] inbits,
					  output logic [15:0] outbits
					  );
					  always_ff @(posedge Clk)
					  begin 
						if(~Reset)
							begin 
								outbits<=16'b0;
							end
						else if(LoadEn)
							begin
								outbits<=inbits;
							end
						end
endmodule 