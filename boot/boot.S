.code16  
.section .data
	buffer: .long 100

.section .text 
	.type  readLine, @function

.global start

readLine:
	readLineLoop:		
		mov 	$0x00,%ah #Escribir el codigo de la interrupcion para leer del teclado
		int 	$0x16 #Se habilita la interrupcion
		call printLine
		#ret

.type printLine, @function
printLine:
	printLineLoop:				
		movb	$0x0E, %ah
		int     $0x10
		#ret

jmp readLine

start:
  # FIRST PHASE: Register y operation mode setup.
  # Assemble for 16-bit mode
    cli
	# The BIOS loads this code from the first sector of the hard disk into
	# memory at physical address 0x7c00 and starts executing in real mode
	# with %cs=0 %ip=7c00.
    movw     $0x07C0,%ax 
    movw     %ax, %ds
    movw     %ax, %es
    movw     %ax, %fs
    movw     %ax, %gs

	#Stack Initialization
    movw     $0x0000 , %ax 
    movw     %ax, %ss
    movw     $0xFFFF,%sp
    sti
	
