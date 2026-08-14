        .arch armv7-a
        .fpu vfpv3-d16
        .eabi_attribute 28, 1
        .eabi_attribute 20, 1
        .eabi_attribute 21, 1
        .eabi_attribute 23, 3
        .eabi_attribute 24, 1
        .eabi_attribute 25, 1
        .eabi_attribute 26, 2
        .eabi_attribute 30, 2
        .eabi_attribute 34, 1
        .eabi_attribute 18, 4
        .file   "mmm.c"
        .text
        .align  1
        .p2align 2,,3
        .global bit_length
        .syntax unified
        .thumb
        .thumb_func
        .type   bit_length, %function
bit_length:
        @ args = 0, pretend = 0, frame = 0
        @ frame_needed = 0, uses_anonymous_args = 0
        @ link register save eliminated.
        orrs    r3, r0, r1
        beq     .L5
        clz     r0, r0
        adds    r0, r0, #32
        cbnz    r1, .L7
        rsb     r0, r0, #64
        bx      lr
.L7:
        clz     r0, r1
        rsb     r0, r0, #64
        bx      lr
.L5:
        movs    r0, #0
        bx      lr
        .size   bit_length, .-bit_length
        .align  1
        .p2align 2,,3
        .global compute_R2
        .syntax unified
        .thumb
        .thumb_func
        .type   compute_R2, %function
compute_R2:
        @ args = 0, pretend = 0, frame = 0
        @ frame_needed = 0, uses_anonymous_args = 0
        push    {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
        mov     r7, r2
        mov     r3, r1
        mov     r2, r0
        mov     r4, r0
        mov     r5, r1
        movs    r0, #1
        movs    r1, #0
        bl      __aeabi_uldivmod(PLT)
        cmp     r7, #0
        mov     r1, r3
        ble     .L17
        mov     r0, r2
        movs    r6, #0
.L10:
        adds    r0, r0, r0
        mov     r2, r4
        adcs    r1, r1, r1
        mov     r3, r5
        adds    r6, r6, #1
        bl      __aeabi_uldivmod(PLT)
        cmp     r7, r6
        mov     r0, r2
        mov     r1, r3
        bne     .L10
        umull   fp, r8, r2, r2
        movs    r0, #0
.L9:
        umull   r6, r2, r1, r2
        movs    r3, #2
        umull   r1, r9, r1, r1
        umlal   r1, r9, r2, r3
        movs    r2, #0
        umlal   r8, r2, r6, r3
        adds    r10, r1, r2
        orr     r8, r8, r0
        mov     r0, #0
        adc     r9, r9, #0
        mov     r1, r0
        movs    r2, #127
.L16:
        sub     r3, r2, #64
        rsb     lr, r2, #96
        sub     ip, r2, #96
        rsb     r7, r2, #32
        lsr     r3, r10, r3
        sub     r6, r2, #32
        lsl     lr, r9, lr
        cmp     r2, #63
        orr     r3, r3, lr
        lsr     ip, r9, ip
        orr     r3, r3, ip
        lsl     r7, r8, r7
        lsr     r6, r8, r6
        and     r3, r3, #1
        ble     .L11
        adds    r0, r0, r0
        orr     r0, r0, r3
        adcs    r1, r1, r1
        cmp     r0, r4
        sbcs    r3, r1, r5
        it      cc
        addcc   r2, r2, #-1
        bcc     .L16
        subs    r0, r0, r4
        add     r2, r2, #-1
        sbc     r1, r1, r5
        b       .L16
.L11:
        lsr     r3, fp, r2
        adds    r0, r0, r0
        orr     r3, r3, r7
        adcs    r1, r1, r1
        orrs    r3, r3, r6
        subs    r2, r2, #1
        and     r3, r3, #1
        orrs    r0, r0, r3
        cmp     r0, r4
        sbcs    r3, r1, r5
        bcc     .L14
        subs    r0, r0, r4
        sbc     r1, r1, r5
.L14:
        adds    r3, r2, #1
        bne     .L16
        pop     {r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L17:
        mov     fp, r2
        mov     r0, r3
        mov     r8, r3
        b       .L9
        .size   compute_R2, .-compute_R2
        .align  1
        .p2align 2,,3
        .global mmm
        .syntax unified
        .thumb
        .thumb_func
        .type   mmm, %function
mmm:
        @ args = 12, pretend = 0, frame = 8
        @ frame_needed = 0, uses_anonymous_args = 0
        push    {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        sub     sp, sp, #12
        ldrd    r5, r10, [sp, #52]
        str     r3, [sp, #4]
        ldr     r4, [sp, #48]
        cmp     r10, #0
        ble     .L30
        mov     ip, #0
        mov     r9, r0
        mov     lr, r1
        mov     r0, ip
        mov     r1, ip
        mov     r6, ip
.L29:
        rsb     r8, ip, #32
        sub     r7, ip, #32
        lsr     r3, r9, ip
        mov     fp, #0
        lsl     r8, lr, r8
        lsr     r7, lr, r7
        orr     r3, r3, r8
        orrs    r3, r3, r7
        and     r8, r0, #1
        and     r3, r3, #1
        and     r7, r3, r2
        cbz     r3, .L22
        mov     r3, fp
        adds    fp, r2, r0
        ldr     r0, [sp, #4]
        adcs    r1, r1, r0
        mov     r0, fp
        it      cs
        movcs   r3, #1
.L22:
        cmp     r6, r6
        it      eq
        cmpeq   r8, r7
        beq     .L25
        adds    r0, r4, r0
        mov     r7, #0
        adcs    r1, r1, r5
        it      cs
        movcs   r7, #1
        cbz     r7, .L25
        adds    r3, r3, #1
.L25:
        lsrs    r0, r0, #1
        lsls    r7, r3, #31
        orr     r0, r0, r1, lsl #31
        orr     r1, r7, r1, lsr #1
        cmp     r0, r4
        ubfx    r3, r3, #1, #1
        sbcs    r7, r1, r5
        it      cs
        orrcs   r3, r3, #1
        cbz     r3, .L28
        subs    r0, r0, r4
        sbc     r1, r1, r5
.L28:
        add     ip, ip, #1
        cmp     r10, ip
        bne     .L29
        add     sp, sp, #12
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L30:
        movs    r0, #0
        mov     r1, r0
        add     sp, sp, #12
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
        .size   mmm, .-mmm
        .align  1
        .p2align 2,,3
        .global mme
        .syntax unified
        .thumb
        .thumb_func
        .type   mme, %function
mme:
        @ args = 24, pretend = 0, frame = 16
        @ frame_needed = 0, uses_anonymous_args = 0
        push    {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        mov     r5, r3
        sub     sp, sp, #36
        ldr     r7, [sp, #72]
        ldr     r6, [sp, #76]
        subs    r3, r7, #1
        ldr     r10, [sp, #80]
        ldrd    r8, [sp, #88]
        orrs    r3, r3, r6
        str     r2, [sp, #20]
        beq     .L44
        mov     r3, r2
        mov     r2, r7
        orrs    r3, r3, r5
        mov     r3, r6
        beq     .L48
        bl      __aeabi_uldivmod(PLT)
        str     r10, [sp, #8]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r8
        mov     r3, r9
        strd    r7, r6, [sp]
        bl      mmm(PLT)
        mov     r3, r1
        mov     r2, r0
        clz     r1, r5
        cmp     r5, #0
        beq     .L49
        rsb     r4, r1, #62
        mov     fp, r2
        mov     lr, r3
        cmp     r1, #63
        beq     .L41
.L50:
        mov     r8, r6
        str     r10, [sp, #16]
        strd    r2, r3, [sp, #24]
.L43:
        ldr     r6, [sp, #16]
        mov     r2, fp
        mov     r3, lr
        mov     r0, fp
        mov     r1, lr
        str     r6, [sp, #8]
        strd    r7, r8, [sp]
        rsb     r10, r4, #32
        bl      mmm(PLT)
        ldr     r6, [sp, #20]
        sub     r9, r4, #32
        lsl     r10, r5, r10
        ldr     r2, [sp, #24]
        mov     fp, r0
        lsr     ip, r6, r4
        ldr     r3, [sp, #28]
        lsr     r9, r5, r9
        orr     ip, ip, r10
        orr     ip, ip, r9
        mov     lr, r1
        tst     ip, #1
        beq     .L42
        ldr     r6, [sp, #16]
        str     r6, [sp, #8]
        strd    r7, r8, [sp]
        bl      mmm(PLT)
        mov     fp, r0
        mov     lr, r1
.L42:
        subs    r4, r4, #1
        bcs     .L43
        ldr     r10, [sp, #16]
        mov     r6, r8
.L41:
        mov     r0, fp
        mov     r1, lr
        movs    r2, #1
        movs    r3, #0
        str     r10, [sp, #80]
        str     r7, [sp, #72]
        str     r6, [sp, #76]
        add     sp, sp, #36
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        b       mmm(PLT)
.L49:
        ldr     r1, [sp, #20]
        mov     fp, r2
        mov     lr, r3
        clz     r1, r1
        adds    r1, r1, #32
        rsb     r4, r1, #62
        cmp     r1, #63
        bne     .L50
        b       .L41
.L48:
        movs    r0, #1
        movs    r1, #0
        bl      __aeabi_uldivmod(PLT)
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #36
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L44:
        movs    r0, #0
        mov     r1, r0
        add     sp, sp, #36
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
        .size   mme, .-mme
        .global __aeabi_uldivmod
        .ident  "GCC: (Debian 14.2.0-19) 14.2.0"
        .section        .note.GNU-stack,"",%progbits