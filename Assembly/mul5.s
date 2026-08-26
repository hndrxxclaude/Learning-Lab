;Scrivere in assembly ARM 32 una subroutine che riceva come unico argomento
;un     intero con segno a 32 bit e restituisca il valore ottenuto
;moltiplicando l'argomento per 5.

              mov     r0, #-10
              bl      multiply_by_5
              mov     r1, r0

multiply_by_5 
              add     r0, r0, r0, lsl #2
              mov     pc, lr