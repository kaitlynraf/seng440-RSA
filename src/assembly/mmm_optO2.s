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
        @ args = 12, pretend = 0, frame = 16
        @ frame_needed = 0, uses_anonymous_args = 0
        push    {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        mov     r6, r1
        and     r1, r2, #1
        sub     sp, sp, #20
        mov     lr, r0
        movs    r0, #0
        str     r1, [sp, #12]
        ldr     r1, [sp, #64]
        ldr     r4, [sp, #56]
        subs    r1, r1, #3
        str     r1, [sp, #8]
        ldr     r1, [sp, #64]
        ldr     r5, [sp, #60]
        cmp     r1, #3
        mov     r1, r0
        it      le
        movle   r10, r0
        ble     .L3
        and     ip, r2, #1
        mov     r9, r0
        str     r0, [sp, #4]
        b       .L2
.L54:
        orr     r7, r7, r10, lsl #31
        mov     r10, r1
.L9:
        cmp     r1, r4
        sbcs    r0, r7, r5
        bcc     .L11
.L10:
        subs    r1, r1, r4
        sbc     r7, r7, r5
        mov     r10, r1
.L11:
        sbfx    r9, r8, #0, #1
        and     r1, r8, ip
        and     r9, r2, r9
        sbfx    r8, r8, #0, #1
        and     fp, r10, #1
        adds    r9, r9, r10
        and     r8, r3, r8
        eor     r1, r1, fp
        adcs    r8, r8, r7
        mov     fp, #0
        it      cs
        movcs   fp, #1
        negs    r1, r1
        sbc     r7, r7, r7
        ands    r1, r1, r4
        adds    r1, r1, r9
        and     r7, r7, r5
        adcs    r7, r7, r8
        lsr     r0, lr, #2
        mov     r10, #0
        lsr     r1, r1, #1
        it      cs
        movcs   r10, #1
        orr     r1, r1, r7, lsl #31
        orr     r0, r0, r6, lsl #30
        lsrs    r7, r7, #1
        cmp     r10, #0
        bne     .L16
        orr     r8, r7, fp, lsl #31
        mov     r10, r1
.L17:
        cmp     r1, r4
        sbcs    r7, r8, r5
        bcc     .L19
.L18:
        subs    r1, r1, r4
        sbc     r8, r8, r5
        mov     r10, r1
.L19:
        sbfx    r9, r0, #0, #1
        and     fp, r0, ip
        and     r9, r2, r9
        sbfx    r0, r0, #0, #1
        adds    r9, r10, r9
        and     r7, r10, #1
        and     r0, r0, r3
        eor     r7, r7, fp
        adcs    r0, r8, r0
        mov     fp, #0
        it      cs
        movcs   fp, #1
        negs    r7, r7
        sbc     r8, r8, r8
        ands    r7, r7, r4
        adds    r7, r9, r7
        and     r8, r5, r8
        adcs    r0, r0, r8
        lsr     r1, lr, #3
        mov     r10, #0
        lsr     r7, r7, #1
        it      cs
        movcs   r10, #1
        orr     r7, r7, r0, lsl #31
        orr     r1, r1, r6, lsl #29
        lsrs    r0, r0, #1
        cmp     r10, #0
        bne     .L24
        orr     r8, r0, fp, lsl #31
        mov     r10, r7
.L25:
        cmp     r7, r4
        sbcs    r0, r8, r5
        bcc     .L27
.L26:
        subs    r7, r7, r4
        sbc     r8, r8, r5
        mov     r10, r7
.L27:
        sbfx    r9, r1, #0, #1
        and     r7, r1, ip
        and     r9, r2, r9
        sbfx    r1, r1, #0, #1
        adds    r9, r10, r9
        and     r0, r10, #1
        and     r1, r1, r3
        eor     r0, r0, r7
        adcs    r1, r8, r1
        mov     r7, #0
        it      cs
        movcs   r7, #1
        negs    r0, r0
        sbc     r8, r8, r8
        ands    r0, r0, r4
        and     r8, r5, r8
        adds    r0, r9, r0
        adcs    r1, r1, r8
        lsr     lr, lr, #4
        mov     r10, #0
        lsr     r8, r0, #1
        it      cs
        movcs   r10, #1
        orr     lr, lr, r6, lsl #28
        orr     r8, r8, r1, lsl #31
        lsrs    r6, r6, #4
        lsrs    r1, r1, #1
        cmp     r10, #0
        bne     .L32
        orr     r1, r1, r7, lsl #31
        mov     r9, r8
.L33:
        cmp     r8, r4
        sbcs    r7, r1, r5
        bcc     .L35
.L34:
        subs    r8, r8, r4
        sbc     r1, r1, r5
        mov     r9, r8
.L35:
        ldr     r7, [sp, #4]
        ldr     r0, [sp, #8]
        adds    r7, r7, #4
        str     r7, [sp, #4]
        cmp     r0, r7
        ble     .L53
.L2:
        mov     r0, r9
        sbfx    fp, lr, #0, #1
        and     r9, r9, #1
        and     r7, lr, ip
        eor     r7, r7, r9
        and     fp, r2, fp
        sbfx    r9, lr, #0, #1
        adds    r0, fp, r0
        and     r9, r3, r9
        mov     r10, #0
        adcs    r9, r9, r1
        lsr     r8, lr, #1
        it      cs
        movcs   r10, #1
        negs    r1, r7
        sbc     r7, r7, r7
        ands    r1, r1, r4
        adds    r1, r1, r0
        and     r7, r7, r5
        adcs    r7, r7, r9
        mov     fp, #0
        lsr     r1, r1, #1
        it      cs
        movcs   fp, #1
        orr     r1, r1, r7, lsl #31
        orr     r8, r8, r6, lsl #31
        lsrs    r7, r7, #1
        cmp     fp, #0
        beq     .L54
        add     r0, r10, #1
        mov     r10, r1
        cmp     r0, #1
        orr     r7, r7, r0, lsl #31
        bne     .L10
        b       .L9
.L24:
        add     fp, fp, #1
        mov     r10, r7
        cmp     fp, #1
        orr     r8, r0, fp, lsl #31
        bne     .L26
        b       .L25
.L16:
        add     fp, fp, #1
        mov     r10, r1
        cmp     fp, #1
        orr     r8, r7, fp, lsl #31
        bne     .L18
        b       .L17
.L32:
        adds    r7, r7, #1
        mov     r9, r8
        cmp     r7, #1
        orr     r1, r1, r7, lsl #31
        bne     .L34
        b       .L33
.L53:
        ldr     r7, [sp, #64]
        mov     r0, r9
        sub     r10, r7, #4
        bic     r10, r10, #3
        add     r10, r10, #4
.L3:
        ldr     r7, [sp, #64]
        cmp     r7, r10
        ble     .L1
        str     r3, [sp, #4]
.L46:
        ldr     r3, [sp, #12]
        and     r8, lr, #1
        and     r9, r0, #1
        rsb     r7, r8, #0
        and     ip, r3, r8
        ldr     r3, [sp, #4]
        eor     ip, ip, r9
        ands    r7, r7, r2
        rsb     r8, r8, #0
        adds    r7, r7, r0
        rsb     r9, ip, #0
        and     r8, r3, r8
        adcs    r1, r8, r1
        mov     ip, r9
        and     r9, r4, r9
        mov     fp, #0
        and     ip, r5, ip
        it      cs
        movcs   fp, #1
        adds    r7, r9, r7
        lsr     lr, lr, #1
        adcs    ip, ip, r1
        orr     lr, lr, r6, lsl #31
        lsr     r7, r7, #1
        mov     r0, #0
        orr     r7, r7, ip, lsl #31
        lsr     r6, r6, #1
        add     r8, fp, #1
        it      cs
        movcs   r0, #1
        lsr     ip, ip, #1
        cbnz    r0, .L42
        orr     r1, ip, fp, lsl #31
        mov     r0, r7
.L43:
        cmp     r7, r4
        sbcs    ip, r1, r5
        bcc     .L45
.L44:
        subs    r7, r7, r4
        sbc     r1, r1, r5
        mov     r0, r7
.L45:
        ldr     r3, [sp, #64]
        add     r10, r10, #1
        cmp     r3, r10
        bne     .L46
.L1:
        add     sp, sp, #20
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L42:
        orr     r1, ip, r8, lsl #31
        mov     r0, r7
        cmp     r8, #1
        bne     .L44
        b       .L43
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
        beq     .L63
        mov     r3, r2
        mov     r2, r7
        orrs    r3, r3, r5
        mov     r3, r6
        beq     .L67
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
        beq     .L68
        rsb     r4, r1, #62
        mov     fp, r2
        mov     lr, r3
        cmp     r1, #63
        beq     .L60
.L69:
        mov     r8, r6
        str     r10, [sp, #16]
        strd    r2, r3, [sp, #24]
.L62:
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
        beq     .L61
        ldr     r6, [sp, #16]
        str     r6, [sp, #8]
        strd    r7, r8, [sp]
        bl      mmm_opt(PLT)
        mov     fp, r0
        mov     lr, r1
.L61:
        subs    r4, r4, #1
        bcs     .L62
        ldr     r10, [sp, #16]
        mov     r6, r8
.L60:
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
.L68:
        ldr     r1, [sp, #20]
        mov     fp, r2
        mov     lr, r3
        clz     r1, r1
        adds    r1, r1, #32
        rsb     r4, r1, #62
        cmp     r1, #63
        bne     .L69
        b       .L60
.L67:
        movs    r0, #1
        movs    r1, #0
        bl      __aeabi_uldivmod(PLT)
        mov     r0, r2
        mov     r1, r3
        add     sp, sp, #36
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L63:
        movs    r0, #0
        mov     r1, r0
        add     sp, sp, #36
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
        .size   mme_opt, .-mme_opt
        .global __aeabi_uldivmod
        .ident  "GCC: (Debian 14.2.0-19) 14.2.0"
        .section        .note.GNU-stack,"",%progbits