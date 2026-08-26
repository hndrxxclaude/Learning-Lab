start              
                   ldr     r0, =array ; load array's address in r0
                   mov     r1, #4 ; load array's size in r1
                   bl      count_even_numbers
                   mov     r0, r3
                   end

count_even_numbers 
                   str     r4, [sp, #-4]! ; PUSH R4
                   lsl     r1, r1, #2 ; r1 = r1 * 2^2 to obtain r1 in bytes
                   add     r1, r1, r0
                   mov     r3, #0 ; zeroed counter

loop               
                   cmp     r0, r1 ; r0 == r1 ?
                   beq     loop_end ; if (r0 == r1), go to loop end
                   ldr     r2, [r0], #4 ; r2 = array[i] and go to the next address
                   asrs    r2, r2, #1 ; r2 = r2 / 2 and set flags
                   addcc   r3, r3, #1 ; if r2 / 2 integer number, increment counter
                   b       loop

loop_end           
                   ldr     r4, [sp], #4 ; POP R4
                   mov     pc, lr ; return to caller

array              dcd     2,7,1,10

