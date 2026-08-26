start              
                   ldr     r0, =array
                   mov     r1, #4
                   bl      count_even_numbers
                   mov     r0, r3
                   end

count_even_numbers 
                   lsl     r1, r1, #2
                   add     r1, r0, r1

loop               
                   cmp     r0, r1
                   moveq   pc, lr
                   ldr     r2, [r0], #4
                   asrs    r2, r2, #1
                   addcs   r3, r3, #1
                   b       loop


array              dcd     8,5,3,7

