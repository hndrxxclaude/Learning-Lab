;Scrivere in assembly ARM 32 una subroutine che modifichi un array,
;di     lunghezza non predefinita, di valori interi senza segno a 32 bit,
;passatocome argomento, dividendo ciascun valore per 4

start                
                     ldr     r0, =data
                     ldr     r1, =4
                     bl      array_divide_by_four
                     end

array_divide_by_four 
                     lsl     r1, r1, #2
                     add     r1, r0, r1

loop                 
                     cmp     r0, r1
                     moveq   pc, lr
                     ldr     r2, [r0]
                     lsr     r2, r2, #2
                     str     r2, [r0], #4
                     b       loop

data                 dcd     10,40,8,16
