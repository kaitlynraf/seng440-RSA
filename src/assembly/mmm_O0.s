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
        .file   "mmm_opt.c"
        .text
        .align  1
        .global mmm_opt
        .syntax unified
        .thumb
        .thumb_func
        .type   mmm_opt, %function
mmm_opt:
        @ args = 12, pretend = 0, frame = 152
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        push    {r4, r5, r7, r8, r9, r10, fp}
        sub     sp, sp, #156
        add     r7, sp, #0
        strd    r0, [r7, #64]
        strd    r2, [r7, #56]
        movs    r3, #0
        str     r3, [r7, #148]
        mov     r2, #0
        mov     r3, #0
        strd    r2, [r7, #136]
        ldrd    r2, [r7, #56]
        and     r4, r2, #1
        movs    r5, #0
        strd    r4, [r7, #112]
        ldrd    r2, [r7, #64]
        strd    r2, [r7, #128]
        ldr     r3, [r7, #192]
        str     r3, [r7, #124]
        b       .L2
.L7:
        ldrd    r2, [r7, #128]
        and     r3, r2, #1
        str     r3, [r7, #40]
        movs    r1, #0
        str     r1, [r7, #44]
        ldrd    r3, [r7, #40]
        strd    r3, [r7, #104]
        ldrd    r2, [r7, #136]
        and     r3, r2, #1
        str     r3, [r7, #32]
        str     r1, [r7, #36]
        ldrd    r3, [r7, #32]
        strd    r3, [r7, #96]
        ldrd    r0, [r7, #104]
        ldrd    r2, [r7, #112]
        and     r8, r0, r2
        and     r9, r1, r3
        ldrd    r2, [r7, #96]
        eor     r1, r2, r8
        str     r1, [r7, #24]
        eor     r3, r3, r9
        str     r3, [r7, #28]
        ldrd    r3, [r7, #24]
        strd    r3, [r7, #88]
        ldrd    r2, [r7, #128]
        mov     r0, #0
        mov     r1, #0
        lsrs    r0, r2, #1
        orr     r0, r0, r3, lsl #31
        lsrs    r1, r3, #1
        strd    r0, [r7, #128]
        ldrd    r2, [r7, #104]
        orrs    r3, r3, r2
        beq     .L3
        ldrd    r2, [r7, #136]
        strd    r2, [r7, #80]
        ldrd    r0, [r7, #136]
        ldrd    r2, [r7, #56]
        adds    r4, r0, r2
        str     r4, [r7, #16]
        adc     r3, r1, r3
        str     r3, [r7, #20]
        ldrd    r3, [r7, #16]
        strd    r3, [r7, #136]
        ldrd    r0, [r7, #136]
        ldrd    r2, [r7, #80]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcs     .L3
        ldr     r3, [r7, #148]
        adds    r3, r3, #1
        str     r3, [r7, #148]
.L3:
        ldrd    r2, [r7, #88]
        orrs    r3, r3, r2
        beq     .L4
        ldrd    r2, [r7, #136]
        strd    r2, [r7, #72]
        ldrd    r0, [r7, #136]
        ldrd    r2, [r7, #184]
        adds    r4, r0, r2
        str     r4, [r7, #8]
        adc     r3, r1, r3
        str     r3, [r7, #12]
        ldrd    r3, [r7, #8]
        strd    r3, [r7, #136]
        ldrd    r0, [r7, #136]
        ldrd    r2, [r7, #72]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcs     .L4
        ldr     r3, [r7, #148]
        adds    r3, r3, #1
        str     r3, [r7, #148]
.L4:
        ldrd    r2, [r7, #136]
        mov     r0, #0
        mov     r1, #0
        lsrs    r0, r2, #1
        orr     r0, r0, r3, lsl #31
        lsrs    r1, r3, #1
        ldr     r3, [r7, #148]
        movs    r2, #0
        str     r3, [r7, #48]
        str     r2, [r7, #52]
        mov     r2, #0
        mov     r3, #0
        ldr     r4, [r7, #48]
        lsls    r3, r4, #31
        movs    r2, #0
        orr     r4, r0, r2
        str     r4, [r7]
        orrs    r3, r3, r1
        str     r3, [r7, #4]
        ldrd    r3, [r7]
        strd    r3, [r7, #136]
        ldr     r3, [r7, #148]
        lsrs    r3, r3, #1
        str     r3, [r7, #148]
        ldr     r3, [r7, #148]
        cmp     r3, #0
        bne     .L5
        ldrd    r0, [r7, #136]
        ldrd    r2, [r7, #184]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcc     .L6
.L5:
        ldrd    r0, [r7, #136]
        ldrd    r2, [r7, #184]
        subs    r10, r0, r2
        sbc     fp, r1, r3
        strd    r10, [r7, #136]
        movs    r3, #0
        str     r3, [r7, #148]
.L6:
        ldr     r3, [r7, #124]
        subs    r3, r3, #1
        str     r3, [r7, #124]
.L2:
        ldr     r3, [r7, #124]
        cmp     r3, #0
        bgt     .L7
        ldrd    r2, [r7, #136]
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #156
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r7, r8, r9, r10, fp}
        bx      lr
        .size   mmm_opt, .-mmm_opt
        .align  1
        .global mme_opt
        .syntax unified
        .thumb
        .thumb_func
        .type   mme_opt, %function
mme_opt:
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
        bne     .L10
        mov     r2, #0
        mov     r3, #0
        b       .L11
.L10:
        ldrd    r2, [r7]
        orrs    r3, r3, r2
        bne     .L12
        mov     r0, #1
        mov     r1, #0
        ldrd    r2, [r7, #88]
        bl      __aeabi_uldivmod(PLT)
        b       .L11
.L12:
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
        bl      mmm_opt(PLT)
        strd    r0, [r7, #32]
        ldrd    r2, [r7]
        cmp     r3, #0
        beq     .L13
        clz     r3, r3
        b       .L14
.L13:
        clz     r3, r2
        adds    r3, r3, #32
.L14:
        rsb     r3, r3, #64
        str     r3, [r7, #28]
        ldrd    r2, [r7, #32]
        strd    r2, [r7, #48]
        ldr     r3, [r7, #28]
        subs    r3, r3, #2
        str     r3, [r7, #44]
        b       .L15
.L17:
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        ldrd    r2, [r7, #48]
        ldrd    r0, [r7, #48]
        bl      mmm_opt(PLT)
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
        beq     .L16
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        ldrd    r2, [r7, #32]
        ldrd    r0, [r7, #48]
        bl      mmm_opt(PLT)
        strd    r0, [r7, #48]
.L16:
        ldr     r3, [r7, #44]
        subs    r3, r3, #1
        str     r3, [r7, #44]
.L15:
        ldr     r3, [r7, #44]
        cmp     r3, #0
        bge     .L17
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        mov     r2, #1
        mov     r3, #0
        ldrd    r0, [r7, #48]
        bl      mmm_opt(PLT)
        strd    r0, [r7, #16]
        ldrd    r2, [r7, #16]
.L11:
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #60
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, pc}
        .size   mme_opt, .-mme_opt
        .global __aeabi_uldivmod
        .ident  "GCC: (Debian 14.2.0-19) 14.2.0"
        .section        .note.GNU-stack,"",%progbits