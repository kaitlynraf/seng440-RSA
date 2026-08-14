        .arch armv7-a
        .fpu vfpv3-d16
        .eabi_attribute 28, 1
        .eabi_attribute 20, 1
        .eabi_attribute 21, 1
        .eabi_attribute 23, 3
        .eabi_attribute 24, 1
        .eabi_attribute 25, 1
        .eabi_attribute 26, 2
        .eabi_attribute 30, 6
        .eabi_attribute 34, 1
        .eabi_attribute 18, 4
        .file   "mmm.c"
        .text
        .align  1
        .global bit_length
        .syntax unified
        .thumb
        .thumb_func
        .type   bit_length, %function
bit_length:
        @ args = 0, pretend = 0, frame = 24
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        push    {r7}
        sub     sp, sp, #28
        add     r7, sp, #0
        strd    r0, [r7]
        movs    r3, #0
        str     r3, [r7, #20]
        ldrd    r2, [r7]
        strd    r2, [r7, #8]
        b       .L2
.L3:
        ldr     r3, [r7, #20]
        adds    r3, r3, #1
        str     r3, [r7, #20]
        ldrd    r0, [r7, #8]
        mov     r2, #0
        mov     r3, #0
        lsrs    r2, r0, #1
        orr     r2, r2, r1, lsl #31
        lsrs    r3, r1, #1
        strd    r2, [r7, #8]
.L2:
        ldrd    r2, [r7, #8]
        orrs    r3, r3, r2
        bne     .L3
        ldr     r3, [r7, #20]
        mov     r0, r3
        adds    r7, r7, #28
        mov     sp, r7
        @ sp needed
        ldr     r7, [sp], #4
        bx      lr
        .size   bit_length, .-bit_length
        .align  1
        .syntax unified
        .thumb
        .thumb_func
        .type   mul32, %function
mul32:
        @ args = 0, pretend = 0, frame = 8
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        push    {r4, r5, r7, r8, r9}
        sub     sp, sp, #12
        add     r7, sp, #0
        str     r0, [r7, #4]
        str     r1, [r7]
        ldr     r1, [r7, #4]
        movs    r0, #0
        mov     r8, r1
        mov     r9, r0
        ldr     r1, [r7]
        movs    r0, #0
        mov     r4, r1
        mov     r5, r0
        mul     r0, r4, r9
        mul     r1, r8, r5
        add     r1, r1, r0
        umull   r2, r3, r8, r4
        add     r1, r1, r3
        mov     r3, r1
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #12
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r7, r8, r9}
        bx      lr
        .size   mul32, .-mul32
        .align  1
        .syntax unified
        .thumb
        .thumb_func
        .type   mul64_wide, %function
mul64_wide:
        @ args = 8, pretend = 0, frame = 120
        @ frame_needed = 1, uses_anonymous_args = 0
        push    {r4, r5, r7, r8, r9, r10, fp, lr}
        sub     sp, sp, #120
        add     r7, sp, #0
        strd    r0, [r7, #56]
        strd    r2, [r7, #48]
        ldr     r3, [r7, #56]
        str     r3, [r7, #116]
        ldrd    r2, [r7, #56]
        mov     r0, #0
        mov     r1, #0
        movs    r0, r3
        movs    r1, #0
        mov     r3, r0
        str     r3, [r7, #112]
        ldr     r3, [r7, #48]
        str     r3, [r7, #108]
        ldrd    r2, [r7, #48]
        mov     r0, #0
        mov     r1, #0
        movs    r0, r3
        movs    r1, #0
        mov     r3, r0
        str     r3, [r7, #104]
        ldr     r1, [r7, #108]
        ldr     r0, [r7, #116]
        bl      mul32(PLT)
        strd    r0, [r7, #96]
        ldr     r1, [r7, #108]
        ldr     r0, [r7, #112]
        bl      mul32(PLT)
        strd    r0, [r7, #88]
        ldr     r1, [r7, #104]
        ldr     r0, [r7, #116]
        bl      mul32(PLT)
        strd    r0, [r7, #80]
        ldr     r1, [r7, #104]
        ldr     r0, [r7, #112]
        bl      mul32(PLT)
        strd    r0, [r7, #72]
        ldrd    r2, [r7, #96]
        mov     r0, #0
        mov     r1, #0
        movs    r0, r3
        movs    r1, #0
        ldr     r3, [r7, #88]
        movs    r2, #0
        str     r3, [r7, #40]
        str     r2, [r7, #44]
        ldr     r3, [r7, #40]
        adds    r10, r0, r3
        ldr     r3, [r7, #44]
        adc     fp, r1, r3
        ldr     r3, [r7, #80]
        movs    r2, #0
        str     r3, [r7, #32]
        str     r2, [r7, #36]
        ldrd    r1, [r7, #32]
        mov     r3, r1
        adds    r3, r10, r3
        str     r3, [r7]
        mov     r3, r2
        adc     r3, fp, r3
        str     r3, [r7, #4]
        ldrd    r2, [r7]
        strd    r2, [r7, #64]
        ldrd    r0, [r7, #64]
        mov     r2, #0
        mov     r3, #0
        movs    r3, r0
        movs    r2, #0
        ldr     r1, [r7, #96]
        movs    r0, #0
        str     r1, [r7, #24]
        str     r0, [r7, #28]
        ldrd    r10, [r7, #24]
        mov     r1, r10
        orrs    r1, r1, r2
        str     r1, [r7, #16]
        mov     r1, fp
        orrs    r1, r1, r3
        str     r1, [r7, #20]
        ldr     r3, [r7, #156]
        ldrd    r1, [r7, #16]
        strd    r1, [r3]
        ldrd    r0, [r7, #88]
        mov     r2, #0
        mov     r3, #0
        movs    r2, r1
        movs    r3, #0
        ldrd    r0, [r7, #72]
        adds    r8, r2, r0
        adc     r9, r3, r1
        ldrd    r0, [r7, #80]
        mov     r2, #0
        mov     r3, #0
        movs    r2, r1
        movs    r3, #0
        adds    r4, r8, r2
        adc     r5, r9, r3
        ldrd    r0, [r7, #64]
        mov     r2, #0
        mov     r3, #0
        movs    r2, r1
        movs    r3, #0
        adds    r1, r4, r2
        str     r1, [r7, #8]
        adc     r3, r5, r3
        str     r3, [r7, #12]
        ldr     r3, [r7, #152]
        ldrd    r1, [r7, #8]
        strd    r1, [r3]
        nop
        adds    r7, r7, #120
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r7, r8, r9, r10, fp, pc}
        .size   mul64_wide, .-mul64_wide
        .align  1
        .syntax unified
        .thumb
        .thumb_func
        .type   mod128, %function
mod128:
        @ args = 8, pretend = 0, frame = 64
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        push    {r4, r5, r6, r7, r8, r9, r10, fp}
        sub     sp, sp, #64
        add     r7, sp, #0
        strd    r0, [r7, #32]
        strd    r2, [r7, #24]
        mov     r2, #0
        mov     r3, #0
        strd    r2, [r7, #56]
        movs    r3, #127
        str     r3, [r7, #52]
        b       .L9
.L13:
        ldr     r3, [r7, #52]
        cmp     r3, #63
        ble     .L10
        ldr     r3, [r7, #52]
        sub     r4, r3, #64
        ldrd    r2, [r7, #32]
        rsb     r1, r4, #32
        sub     r0, r4, #32
        lsr     r8, r2, r4
        lsl     r1, r3, r1
        orr     r8, r8, r1
        lsr     r0, r3, r0
        orr     r8, r8, r0
        lsr     r9, r3, r4
        and     r5, r8, #1
        movs    r6, #0
        b       .L11
.L10:
        ldrd    r2, [r7, #24]
        ldr     r4, [r7, #52]
        rsb     r1, r4, #32
        sub     r0, r4, #32
        lsr     r10, r2, r4
        lsl     r1, r3, r1
        orr     r10, r10, r1
        lsr     r0, r3, r0
        orr     r10, r10, r0
        lsr     fp, r3, r4
        and     r5, r10, #1
        movs    r6, #0
.L11:
        strd    r5, [r7, #40]
        ldrd    r2, [r7, #56]
        adds    r1, r2, r2
        str     r1, [r7, #16]
        adcs    r3, r3, r3
        str     r3, [r7, #20]
        ldrd    r0, [r7, #16]
        ldrd    r2, [r7, #40]
        orr     r4, r2, r0
        str     r4, [r7, #8]
        orrs    r3, r3, r1
        str     r3, [r7, #12]
        ldrd    r3, [r7, #8]
        strd    r3, [r7, #56]
        ldrd    r0, [r7, #56]
        ldrd    r2, [r7, #96]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcc     .L12
        ldrd    r0, [r7, #56]
        ldrd    r2, [r7, #96]
        subs    r4, r0, r2
        str     r4, [r7]
        sbc     r3, r1, r3
        str     r3, [r7, #4]
        ldrd    r3, [r7]
        strd    r3, [r7, #56]
.L12:
        ldr     r3, [r7, #52]
        subs    r3, r3, #1
        str     r3, [r7, #52]
.L9:
        ldr     r3, [r7, #52]
        cmp     r3, #0
        bge     .L13
        ldrd    r2, [r7, #56]
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #64
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp}
        bx      lr
        .size   mod128, .-mod128
        .align  1
        .global compute_R2
        .syntax unified
        .thumb
        .thumb_func
        .type   compute_R2, %function
compute_R2:
        @ args = 0, pretend = 0, frame = 48
        @ frame_needed = 1, uses_anonymous_args = 0
        push    {r4, r5, r7, lr}
        sub     sp, sp, #56
        add     r7, sp, #8
        strd    r0, [r7, #8]
        str     r2, [r7, #4]
        mov     r0, #1
        mov     r1, #0
        ldrd    r2, [r7, #8]
        bl      __aeabi_uldivmod(PLT)
        strd    r2, [r7, #40]
        movs    r3, #0
        str     r3, [r7, #36]
        b       .L16
.L17:
        ldrd    r2, [r7, #40]
        adds    r4, r2, r2
        adc     r5, r3, r3
        mov     r0, r4
        mov     r1, r5
        ldrd    r2, [r7, #8]
        bl      __aeabi_uldivmod(PLT)
        strd    r2, [r7, #40]
        ldr     r3, [r7, #36]
        adds    r3, r3, #1
        str     r3, [r7, #36]
.L16:
        ldr     r2, [r7, #36]
        ldr     r3, [r7, #4]
        cmp     r2, r3
        blt     .L17
        add     r3, r7, #16
        str     r3, [sp, #4]
        add     r3, r7, #24
        str     r3, [sp]
        ldrd    r2, [r7, #40]
        ldrd    r0, [r7, #40]
        bl      mul64_wide(PLT)
        ldrd    r0, [r7, #24]
        ldrd    r4, [r7, #16]
        ldrd    r2, [r7, #8]
        strd    r2, [sp]
        mov     r2, r4
        mov     r3, r5
        bl      mod128(PLT)
        mov     r2, r0
        mov     r3, r1
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #48
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r7, pc}
        .size   compute_R2, .-compute_R2
        .align  1
        .global mmm
        .syntax unified
        .thumb
        .thumb_func
        .type   mmm, %function
mmm:
        @ args = 12, pretend = 0, frame = 160
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        push    {r4, r5, r7, r8, r9, r10, fp}
        sub     sp, sp, #164
        add     r7, sp, #0
        strd    r0, [r7, #80]
        strd    r2, [r7, #72]
        mov     r2, #0
        mov     r3, #0
        strd    r2, [r7, #152]
        mov     r2, #0
        mov     r3, #0
        strd    r2, [r7, #144]
        ldrd    r2, [r7, #72]
        and     r4, r2, #1
        movs    r5, #0
        strd    r4, [r7, #128]
        movs    r3, #0
        str     r3, [r7, #140]
        b       .L20
.L25:
        ldrd    r2, [r7, #80]
        ldr     r4, [r7, #140]
        rsb     r1, r4, #32
        sub     r0, r4, #32
        lsr     r8, r2, r4
        lsl     r1, r3, r1
        orr     r8, r8, r1
        lsr     r0, r3, r0
        orr     r8, r8, r0
        lsr     r9, r3, r4
        and     r3, r8, #1
        str     r3, [r7, #64]
        movs    r1, #0
        str     r1, [r7, #68]
        ldrd    r3, [r7, #64]
        strd    r3, [r7, #120]
        ldrd    r2, [r7, #144]
        and     r3, r2, #1
        str     r3, [r7, #56]
        str     r1, [r7, #60]
        ldrd    r3, [r7, #56]
        strd    r3, [r7, #112]
        ldrd    r0, [r7, #120]
        ldrd    r2, [r7, #128]
        and     r10, r0, r2
        and     fp, r1, r3
        ldrd    r2, [r7, #112]
        eor     r1, r2, r10
        str     r1, [r7, #48]
        eor     r3, r3, fp
        str     r3, [r7, #52]
        ldrd    r3, [r7, #48]
        strd    r3, [r7, #104]
        ldrd    r2, [r7, #120]
        orrs    r3, r3, r2
        beq     .L21
        ldrd    r2, [r7, #144]
        strd    r2, [r7, #96]
        ldrd    r0, [r7, #144]
        ldrd    r2, [r7, #72]
        adds    r4, r0, r2
        str     r4, [r7, #40]
        adc     r3, r1, r3
        str     r3, [r7, #44]
        ldrd    r3, [r7, #40]
        strd    r3, [r7, #144]
        ldrd    r0, [r7, #144]
        ldrd    r2, [r7, #96]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcs     .L21
        ldrd    r2, [r7, #152]
        adds    r1, r2, #1
        str     r1, [r7, #32]
        adc     r3, r3, #0
        str     r3, [r7, #36]
        ldrd    r3, [r7, #32]
        strd    r3, [r7, #152]
.L21:
        ldrd    r2, [r7, #104]
        orrs    r3, r3, r2
        beq     .L22
        ldrd    r2, [r7, #144]
        strd    r2, [r7, #88]
        ldrd    r0, [r7, #144]
        ldrd    r2, [r7, #192]
        adds    r4, r0, r2
        str     r4, [r7, #24]
        adc     r3, r1, r3
        str     r3, [r7, #28]
        ldrd    r3, [r7, #24]
        strd    r3, [r7, #144]
        ldrd    r0, [r7, #144]
        ldrd    r2, [r7, #88]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcs     .L22
        ldrd    r2, [r7, #152]
        adds    r1, r2, #1
        str     r1, [r7, #16]
        adc     r3, r3, #0
        str     r3, [r7, #20]
        ldrd    r3, [r7, #16]
        strd    r3, [r7, #152]
.L22:
        ldrd    r2, [r7, #144]
        mov     r4, #0
        mov     r5, #0
        lsrs    r4, r2, #1
        orr     r4, r4, r3, lsl #31
        lsrs    r5, r3, #1
        ldrd    r2, [r7, #152]
        mov     r0, #0
        mov     r1, #0
        lsls    r1, r2, #31
        movs    r0, #0
        orr     r3, r4, r0
        str     r3, [r7, #8]
        orr     r3, r5, r1
        str     r3, [r7, #12]
        ldrd    r3, [r7, #8]
        strd    r3, [r7, #144]
        ldrd    r2, [r7, #152]
        mov     r0, #0
        mov     r1, #0
        lsrs    r0, r2, #1
        orr     r0, r0, r3, lsl #31
        lsrs    r1, r3, #1
        strd    r0, [r7, #152]
        ldrd    r2, [r7, #152]
        orrs    r3, r3, r2
        bne     .L23
        ldrd    r0, [r7, #144]
        ldrd    r2, [r7, #192]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcc     .L24
.L23:
        ldrd    r0, [r7, #144]
        ldrd    r2, [r7, #192]
        subs    r4, r0, r2
        str     r4, [r7]
        sbc     r3, r1, r3
        str     r3, [r7, #4]
        ldrd    r3, [r7]
        strd    r3, [r7, #144]
        mov     r2, #0
        mov     r3, #0
        strd    r2, [r7, #152]
.L24:
        ldr     r3, [r7, #140]
        adds    r3, r3, #1
        str     r3, [r7, #140]
.L20:
        ldr     r2, [r7, #140]
        ldr     r3, [r7, #200]
        cmp     r2, r3
        blt     .L25
        ldrd    r2, [r7, #144]
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #164
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r7, r8, r9, r10, fp}
        bx      lr
        .size   mmm, .-mmm
        .align  1
        .global mme
        .syntax unified
        .thumb
        .thumb_func
        .type   mme, %function
mme:
        @ args = 24, pretend = 0, frame = 56
        @ frame_needed = 1, uses_anonymous_args = 0
        push    {r4, r5, r6, r7, r8, r9, lr}
        sub     sp, sp, #76
        add     r7, sp, #16
        strd    r0, [r7, #8]
        strd    r2, [r7]
        ldrd    r2, [r7, #88]
        subs    r1, r2, #1
        orrs    r3, r3, r1
        bne     .L28
        mov     r2, #0
        mov     r3, #0
        b       .L29
.L28:
        ldrd    r2, [r7]
        orrs    r3, r3, r2
        bne     .L30
        mov     r0, #1
        mov     r1, #0
        ldrd    r2, [r7, #88]
        bl      __aeabi_uldivmod(PLT)
        b       .L29
.L30:
        ldrd    r0, [r7, #8]
        ldrd    r2, [r7, #88]
        bl      __aeabi_uldivmod(PLT)
        mov     r0, r2
        mov     r1, r3
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        ldrd    r2, [r7, #104]
        bl      mmm(PLT)
        strd    r0, [r7, #32]
        ldrd    r0, [r7]
        bl      bit_length(PLT)
        str     r0, [r7, #28]
        ldrd    r2, [r7, #32]
        strd    r2, [r7, #48]
        ldr     r3, [r7, #28]
        subs    r3, r3, #2
        str     r3, [r7, #44]
        b       .L31
.L33:
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        ldrd    r2, [r7, #48]
        ldrd    r0, [r7, #48]
        bl      mmm(PLT)
        strd    r0, [r7, #48]
        ldrd    r2, [r7]
        ldr     r1, [r7, #44]
        rsb     r6, r1, #32
        sub     r0, r1, #32
        lsr     r4, r2, r1
        lsl     r6, r3, r6
        orrs    r4, r4, r6
        lsr     r0, r3, r0
        orrs    r4, r4, r0
        lsr     r5, r3, r1
        and     r8, r4, #1
        mov     r9, #0
        orrs    r3, r8, r9
        beq     .L32
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        ldrd    r2, [r7, #32]
        ldrd    r0, [r7, #48]
        bl      mmm(PLT)
        strd    r0, [r7, #48]
.L32:
        ldr     r3, [r7, #44]
        subs    r3, r3, #1
        str     r3, [r7, #44]
.L31:
        ldr     r3, [r7, #44]
        cmp     r3, #0
        bge     .L33
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        mov     r2, #1
        mov     r3, #0
        ldrd    r0, [r7, #48]
        bl      mmm(PLT)
        strd    r0, [r7, #16]
        ldrd    r2, [r7, #16]
.L29:
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #60
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, pc}
        .size   mme, .-mme
        .global __aeabi_uldivmod
        .ident  "GCC: (Debian 14.2.0-19) 14.2.0"
        .section        .note.GNU-stack,"",%progbits

        