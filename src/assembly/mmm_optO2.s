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
        .file   "mmm_opt.c"
        .text
        .align  1
        .p2align 2,,3
        .global mmm_opt
        .syntax unified
        .thumb
        .thumb_func
        .type   mmm_opt, %function
mmm_opt:
        @ args = 12, pretend = 0, frame = 0
        @ frame_needed = 0, uses_anonymous_args = 0
        push    {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        ldr     r4, [sp, #36]
        ldrd    r6, r5, [sp, #40]
        cmp     r5, #0
        ble     .L11
        mov     ip, r0
        movs    r0, #0
        mov     lr, r1
        mov     fp, r3
        mov     r1, r0
        mov     r10, r0
        mov     r9, r0
.L10:
        and     r3, ip, #1
        lsr     ip, ip, #1
        orr     ip, ip, lr, lsl #31
        and     r7, r0, #1
        lsr     lr, lr, #1
        and     r8, r3, r2
        cbz     r3, .L3
        adds    r0, r2, r0
        mov     r3, #0
        adcs    r1, fp, r1
        it      cs
        movcs   r3, #1
.L3:
        cmp     r10, r9
        it      eq
        cmpeq   r8, r7
        beq     .L6
        adds    r0, r4, r0
        mov     r7, #0
        adcs    r1, r1, r6
        it      cs
        movcs   r7, #1
        cbz     r7, .L6
        adds    r3, r3, #1
.L6:
        lsrs    r0, r0, #1
        lsls    r7, r3, #31
        orr     r0, r0, r1, lsl #31
        orr     r1, r7, r1, lsr #1
        cmp     r0, r4
        ubfx    r3, r3, #1, #1
        sbcs    r7, r1, r6
        it      cs
        orrcs   r3, r3, #1
        cbz     r3, .L9
        subs    r0, r0, r4
        sbc     r1, r1, r6
.L9:
        subs    r5, r5, #1
        bne     .L10
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L11:
        movs    r0, #0
        mov     r1, r0
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
        .size   mmm_opt, .-mmm_opt
        .align  1
        .p2align 2,,3
        .global mme_opt
        .syntax unified
        .thumb
        .thumb_func
        .type   mme_opt, %function
mme_opt:
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
        beq     .L27
        mov     r3, r2
        mov     r2, r7
        orrs    r3, r3, r5
        mov     r3, r6
        beq     .L31
        bl      __aeabi_uldivmod(PLT)
        str     r10, [sp, #8]
        mov     r0, r2
        mov     r1, r3
        mov     r2, r8
        mov     r3, r9
        strd    r7, r6, [sp]
        bl      mmm_opt(PLT)
        mov     r3, r1
        mov     r2, r0
        clz     r1, r5
        cmp     r5, #0
        beq     .L32
        rsb     r4, r1, #62
        mov     fp, r2
        mov     lr, r3
        cmp     r1, #63
        beq     .L24
.L33:
        mov     r8, r6
        str     r10, [sp, #16]
        strd    r2, r3, [sp, #24]
.L26:
        ldr     r6, [sp, #16]
        mov     r2, fp
        mov     r3, lr
        mov     r0, fp
        mov     r1, lr
        str     r6, [sp, #8]
        strd    r7, r8, [sp]
        rsb     r10, r4, #32
        bl      mmm_opt(PLT)
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
        beq     .L25
        ldr     r6, [sp, #16]
        str     r6, [sp, #8]
        strd    r7, r8, [sp]
        bl      mmm_opt(PLT)
        mov     fp, r0
        mov     lr, r1
.L25:
        subs    r4, r4, #1
        bcs     .L26
        ldr     r10, [sp, #16]
        mov     r6, r8
.L24:
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
        b       mmm_opt(PLT)
.L32:
        ldr     r1, [sp, #20]
        mov     fp, r2
        mov     lr, r3
        clz     r1, r1
        adds    r1, r1, #32
        rsb     r4, r1, #62
        cmp     r1, #63
        bne     .L33
        b       .L24
.L31:
        movs    r0, #1
        movs    r1, #0
        bl      __aeabi_uldivmod(PLT)
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #36
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L27:
        movs    r0, #0
        mov     r1, r0
        add     sp, sp, #36
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
        .size   mme_opt, .-mme_opt
        .global __aeabi_uldivmod
        .ident  "GCC: (Debian 14.2.0-19) 14.2.0"
        .section        .note.GNU-stack,"",%progbits