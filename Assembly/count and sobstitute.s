;Scrivere in assembly ARM 32 una subroutine (count_and_substitute) che restituisca il
;numero di valori negativi contenuti in un array di valori interi con segno a 32 bit
;passatocome argomento e li sostituisca con un valore passato come ulteriore
;argomento. Il codice deve essere integrato nell'esempio d'uso indicato a fianco.
;Supponendo che l'array sia caricato in memoria a partire dall'indirizzo 0x200, il
;contenuto della memoria dopo l'esecuzione di count_and_substitute con argomento di
;sostituzione 3 sarà quello mostrato nella tabella

start                
                     ldr     r0, =array
                     mov     r1, #4
                     mov     r2, #3
                     bl      count_and_substitute
                     end

count_and_substitute 
                     str     r4, [sp, #-4]! ;PUSH R4
                     add     r1, r0, r1, lsl #2
                     mov     r3, r0
                     mov     r0, #0

loop                 
                     cmp     r3, r1
                     beq     loop_end
                     ldr     r4, [r3], #4
                     cmp     r4, #0
                     strmi   r2, [r3, #-4]
                     addmi   r0, r0, #1
                     b       loop

loop_end             
                     ldr     r4, [sp], #4 ;POP R4
                     mov     pc, lr

array                dcd     4,-3,-2,1