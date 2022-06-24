        ORG     0000H 	
	    AJMP    MAIN		
;************************************************    
	    ORG     0080H
 MAIN:  MOV     TMOD,#00100000B
		MOV     TH1,#0E6H
        MOV     TL1,#0E6H
        SETB    TR1
        MOV     SCON,#01110000B
;=======================================
;LOOP:   CLR     RI
;        MOV     A,SBUF
;		CJNE    A,#':',LOOP
;		
;		AJMP    WAIT
;; ===========================
STARTADC:
		CLR     P1.7
        SETB    P1.7
		MOV     P1,#11111111B
;=======================================
SERVODOWN:
		MOV     R5,#10
D135P:	SETB     P1.0
		MOV     R2,#5;on 200uX10u=2m sec servo135
		ACALL DELAYPWM
        CLR     P1.0
		MOV     R2,#9 ;off 20m-2m=18msec 200x8 18m servo45
		ACALL DELAYPWM
		DJNZ  R5,D135P
;=======================================
WAIT:   JB      P1.6,WAIT
READ:   MOV     A,P2
        MOV     B,A
;=======================================
        CLR     C
        SUBB    A,#128
        JNC     LARGE
;=======================================

       AJMP	STARTADC
;=======================================
;=======================================
LARGE:  MOV     P1,#11000111B
;=======================================
SERVOOPEN:
		MOV     R5,#10
D45P:	SETB     P1.0
		MOV     R2,#10;on 200uX5u=1m sec servo45
		ACALL DELAYPWM
        CLR     P1.0
		MOV     R2,#9 ;off 20m-1m=19msec 200x9 18m servo45
		ACALL DELAYPWM
		DJNZ  R5,D45P
;=======================================
SEND10: CLR 	TI
		PUSH    ACC
		MOV     A,#'P'
		MOV		SBUF,A
		JNB		TI,$
		POP     ACC
;=======================================
DELAY:	
DL0:	MOV     R3,#40
DL1:	MOV     R4,#200
DL2:    MOV     R7,#200
DL3:    DJNZ    R7,DL3
		DJNZ    R4,DL2
		DJNZ    R3,DL1
		AJMP	STARTADC
;=======================================
DELAYPWM:
D2:    MOV     R1,#100
D3:    DJNZ    R1,D3
		DJNZ    R2,D2
		RET
		;
		END
