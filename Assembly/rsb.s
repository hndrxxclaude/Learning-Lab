;Scrivere in assembly ARM 32 una subroutine che riceva come unico argomento
;un valore intero con segno a 32 bit e restituisca il valore ricevuto
;cambiato di segno.

       mov     r0, #-3
       bl      negate
       mov     r1, r0
negate 
       rsb     r0, r0, #0
       mov     pc, lr