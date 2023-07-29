			AREA 	FindAreaSphere, CODE, READONLY
			EXPORT 	__main
; python3 find ara 	and volume of sphere
;def area(radius):
;	return 4*pi*radius**2			
__SUFACE_AREA
; RADIUS IS R1
		VLDR.F32		S0, C_Zero	; SET R0 TO 0
		VLDR.F32 		S2, C_Four		; Load regester with 4
		VLDR.F32		S3, C_Pi	; load pi
		
		VMUL.F32		S0,S1,S1	; radius**2 val to R0
		VMUL.F32		S0,S3,S0	; pi*radius**2 val to R0
		VMUL.F32		S0,S2,S0  	;4*pi*radius**2 val to OR
		VMOV			R0, S0
		BX				LR			;return retult R0
		

;def volume(radius):
;	return (4/3) * math.pi * radius**3
__SPHERE_VOLUME
;RADIUS R1
		VLDR.F32		S0,	C_Zero	; set r0 to 0
		VLDR.F32		S2,C_FourThirds	; load 4/3 in regester
		VLDR.F32		S4,C_Pi		; load pi
		VMUL.F32		S0,S1,S1	; radius * radius
		VMUL.F32		S0,S1,S0	;	radius*radius*radius
		VMUL.F32		S0,S0,S4	; r**3*pi
		VMUL.F32 		S0, S0, S2	; 4/3*pi*radius**3
		VMOV			R0, S0
		BX 				LR			;returns result R0
	
	

				
__main
			VLDR.F32	S1,C_Two				; RADIUS 2
			BL			__SUFACE_AREA		; call surface_area(2)
			MOV			R5,R0				; store value
			BL			__SPHERE_VOLUME		;	call sphere_voluem(2)
			MOV			R6,R0				;	store return
			VLDR.F32	S1,C_Three				; RADIUS 3
			BL			__SUFACE_AREA		; call surface_area(3)
			MOV			R7,R0				; store value
			BL			__SPHERE_VOLUME		;	call sphere_voluem(3)
			MOV			R8,R0				;	store return
			VLDR.F32	S1,C_Four				; RADIUS 2
			BL			__SUFACE_AREA		; call surface_area(4)
			MOV			R9,R0				; store value
			BL			__SPHERE_VOLUME		;	call sphere_voluem(4)
			MOV			R10,R0				;	store return
			VLDR.F32	S1,C_Five			; RADIUS 5
			BL			__SUFACE_AREA		; call surface_area(5)
			MOV			R11,R0				; store value
			BL			__SPHERE_VOLUME		;	call sphere_voluem(5)
			MOV			R12,R0				;	store return
			
			
Stop	B		Stop

C_Zero		DCD		0x00000000   ; Decimal representation of 0.0 in single-precision floating-point format
C_Two		DCD		0x40000000   ; Decimal representation of 2.0 in single-precision floating-point format
C_Three		DCD		0x40400000   ; Decimal representation of 3.0 in single-precision floating-point format
C_Four		DCD		0x40800000   ; Decimal representation of 4.0 in single-precision floating-point format
C_Five		DCD		0x40A00000   ; Decimal representation of 5.0 in single-precision floating-point format
C_FourThirds   DCD     0x3FAAAAAB   ; Decimal representation of (4/3) in single-precision floating-point format
C_Pi    	DCD     0x40490FDB            ; Decimal representation of p (pi)
C_e			DCD		0x402DF854
			ALIGN
			END