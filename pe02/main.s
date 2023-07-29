						AREA 	Swap, CODE, READONLY
			EXPORT 	__main
				
__main

			LDR 		R0, =0xE000ED88
			LDR			R1, [R0]
			
			ORR			R1,R1,#(0XF << 20)
			STR			R1,[R0]
			
			VLDR.F		S5,C_Pi
			VLDR.F		S6,C_Ten
			VMUL.F		S7,S5,S6
			
Stop	B		Stop

C_One		DCD		0x3F800000
C_Two		DCD		0x40000000
C_NZero		DCD		0x80000000
C_Ten		DCD		0x41200000
C_Hun		DCD		0x42C80000
C_Pi		DCD		0x40490FDB
C_e			DCD		0x402DF854
			ALIGN
			END