
obj/boot/boot.out:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00007c00 <readLine>:

.global start

readLine:
	readLineLoop:		
		mov 	$0x00,%ah #Escribir el codigo de la interrupcion para leer del teclado
    7c00:	b4 00                	mov    $0x0,%ah
		int 	$0x16 #Se habilita la interrupcion
    7c02:	cd 16                	int    $0x16
		call printLine
    7c04:	e8 00 00 b4 0e       	call   eb47c09 <__bss_start+0xeb3ffa9>

00007c07 <printLine>:
		#ret

.type printLine, @function
printLine:
	printLineLoop:				
		movb	$0x0E, %ah
    7c07:	b4 0e                	mov    $0xe,%ah
		int     $0x10
    7c09:	cd 10                	int    $0x10
		#ret

jmp readLine
    7c0b:	eb f3                	jmp    7c00 <readLine>

00007c0d <start>:

start:
  # FIRST PHASE: Register y operation mode setup.
  # Assemble for 16-bit mode
    cli
    7c0d:	fa                   	cli    
	# The BIOS loads this code from the first sector of the hard disk into
	# memory at physical address 0x7c00 and starts executing in real mode
	# with %cs=0 %ip=7c00.
    movw     $0x07C0,%ax 
    7c0e:	b8 c0 07 8e d8       	mov    $0xd88e07c0,%eax
    movw     %ax, %ds
    movw     %ax, %es
    7c13:	8e c0                	mov    %eax,%es
    movw     %ax, %fs
    7c15:	8e e0                	mov    %eax,%fs
    movw     %ax, %gs
    7c17:	8e e8                	mov    %eax,%gs

	#Stack Initialization
    movw     $0x0000 , %ax 
    7c19:	b8 00 00 8e d0       	mov    $0xd08e0000,%eax
    movw     %ax, %ss
    movw     $0xFFFF,%sp
    7c1e:	bc ff ff fb 55       	mov    $0x55fbffff,%esp

00007c22 <bootmain>:



void
bootmain(void)
{
    7c22:	55                   	push   %ebp
    7c23:	89 e5                	mov    %esp,%ebp
	//To be continued...
	int i;
	while (1)
	{/* do nothing */
	
	}
    7c25:	eb fe                	jmp    7c25 <bootmain+0x3>
