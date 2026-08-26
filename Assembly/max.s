;Scrivere in assembly ARM 32 una subroutine che riceva come argomenti
;due    interi con segno a 32 bit e restituisca il massimo tra i due.

start  
       mov     r0, #10
       mov     r1, #7
       bl      max
       mov     r2, r0
       end

max    
       cmp     r0, r1
       movlt   r0, r1
       mov     pc, lr
