.include     "address_map_arm.s"
.equ     STACK_BASE , 0x30000000
.text
.global      _start
_start:
           LDR      R1, =LED_BASE    /*  Address  of red  LEDs.  */
           LDR      R2, =SW_BASE     /*  Address  of  switches.  */
           LDR      R3, =HEX3_HEX0_BASE      /*  Address  of  bottom  four  SSDs */
           LDR      R4, =HEX5_HEX4_BASE      /*  Address  of top  two  SSDs */
		   LDR      R6, =KEY_BASE
           
LOOP:
           LDR      R5, [R2]          /* Read  the  state of  switches.  */
                     /* Call  decoder  subroutine  */
		   
		   LDR      R6, Last
		   LDR      R7, First
		   LDR      R8, [R5]
		   LDR      R9, [R5]
		   
		   MUL      R8, R6,R8
		   MUL      R9, R7, R9
		   BL       SSD_Patterns 
		   
		// ADD      R5, R8, R9 
	   
           STR      R8, [R3]    /*  Display  to HEX0 */
           STR      R9, [R4]          /*  Display  to HEX4 */
		   
		// LDR      R7, [R6] //Read the state of key button
		// CMP      R7, #8 //push button key 3
		 //BEQ      ADD
		   
		   
           B         LOOP               /* Loop  main  routine  */
          
SSD_Patterns:
        CMP     R5, #6
        MOVEQ   R5, #125
		
		CMP     R5, #0
        MOVEQ   R5, #0
		
		CMP     R5, #1
        MOVEQ   R5, #6

        CMP     R5, #2
        MOVEQ   R5, #91

		CMP     R5, #3
        MOVEQ   R5, #79
		
		CMP     R5, #4
        MOVEQ   R5, #102
		
		CMP     R5, #5
        MOVEQ   R5, #109
		
		CMP     R5, #7
        MOVEQ   R5, #7
		
		CMP     R5, #8
        MOVEQ   R5, #127
		
		CMP     R5, #9
        MOVEQ   R5, #103
		
		CMP     R5, #10
        MOVEQ   R5, #119
		
		CMP     R5, #11
		MOVEQ   R5, #124
		
		CMP     R5, #12
        MOVEQ   R5, #57
		
		CMP     R5, #13
		MOVEQ   R5, #94
		
		CMP     R5, #14
		MOVEQ   R5, #121
		
		CMP     R5, #15
		MOVEQ   R5, #113
		
		MOV     PC, LR
		
Last:
.word 0b0000000F
First:
.word 0b000000F0
.end