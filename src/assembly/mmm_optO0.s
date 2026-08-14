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
        .syntax unified
        .thumb
        .thumb_func
        .type   mmm_step, %function
mmm_step:
        @ args = 24, pretend = 0, frame = 72
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        push    {r4, r5, r7, r8, r9, r10, fp}
        sub     sp, sp, #76
        add     r7, sp, #0
        strd    r0, [r7, #40]
        strd    r2, [r7, #32]
        ldr     r2, [r7, #44]
        ldr     r3, [r7, #32]
        mul     r1, r3, r2
        ldr     r2, [r7, #36]
        ldr     r3, [r7, #40]
        mul     r3, r2, r3
        add     r1, r1, r3
        ldr     r2, [r7, #40]
        ldr     r3, [r7, #32]
        umull   r4, r5, r2, r3
        adds    r3, r1, r5
        mov     r5, r3
        strd    r4, [r7, #64]
        strd    r4, [r7, #64]
        ldr     r3, [r7, #120]
        ldrd    r2, [r3]
        strd    r2, [r7, #56]
        ldr     r3, [r7, #120]
        ldrd    r0, [r3]
        ldrd    r2, [r7, #64]
        adds    r10, r0, r2
        adc     fp, r1, r3
        ldr     r3, [r7, #120]
        strd    r10, [r3]
        ldr     r3, [r7, #120]
        ldrd    r0, [r3]
        ldrd    r2, [r7, #56]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcs     .L2
        ldr     r3, [r7, #124]
        ldr     r3, [r3]
        adds    r2, r3, #1
        ldr     r3, [r7, #124]
        str     r2, [r3]
.L2:
        ldr     r3, [r7, #108]
        ldr     r2, [r7, #112]
        mul     r2, r3, r2
        ldr     r3, [r7, #116]
        ldr     r1, [r7, #104]
        mul     r3, r1, r3
        add     r3, r3, r2
        ldr     r1, [r7, #104]
        ldr     r2, [r7, #112]
        umull   r8, r9, r1, r2
        add     r3, r3, r9
        mov     r9, r3
        strd    r8, [r7, #48]
        strd    r8, [r7, #48]
        ldr     r3, [r7, #120]
        ldrd    r2, [r3]
        strd    r2, [r7, #56]
        ldr     r3, [r7, #120]
        ldrd    r0, [r3]
        ldrd    r2, [r7, #48]
        adds    r4, r0, r2
        str     r4, [r7, #24]
        adc     r3, r1, r3
        str     r3, [r7, #28]
        ldr     r3, [r7, #120]
        ldrd    r1, [r7, #24]
        strd    r1, [r3]
        ldr     r3, [r7, #120]
        ldrd    r0, [r3]
        ldrd    r2, [r7, #56]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcs     .L3
        ldr     r3, [r7, #124]
        ldr     r3, [r3]
        adds    r2, r3, #1
        ldr     r3, [r7, #124]
        str     r2, [r3]
.L3:
        ldr     r3, [r7, #120]
        ldrd    r0, [r3]
        mov     r2, #0
        mov     r3, #0
        lsrs    r2, r0, #1
        orr     r2, r2, r1, lsl #31
        lsrs    r3, r1, #1
        ldr     r1, [r7, #124]
        ldr     r1, [r1]
        movs    r0, #0
        str     r1, [r7, #16]
        str     r0, [r7, #20]
        mov     r0, #0
        mov     r1, #0
        ldr     r4, [r7, #16]
        lsls    r1, r4, #31
        movs    r0, #0
        orr     r4, r2, r0
        str     r4, [r7, #8]
        orrs    r3, r3, r1
        str     r3, [r7, #12]
        ldr     r3, [r7, #120]
        ldrd    r1, [r7, #8]
        strd    r1, [r3]
        ldr     r3, [r7, #124]
        ldr     r3, [r3]
        lsrs    r2, r3, #1
        ldr     r3, [r7, #124]
        str     r2, [r3]
        ldr     r3, [r7, #124]
        ldr     r3, [r3]
        cmp     r3, #0
        bne     .L4
        ldr     r3, [r7, #120]
        ldrd    r0, [r3]
        ldrd    r2, [r7, #112]
        cmp     r0, r2
        sbcs    r3, r1, r3
        bcc     .L6
.L4:
        ldr     r3, [r7, #120]
        ldrd    r0, [r3]
        ldrd    r2, [r7, #112]
        subs    r4, r0, r2
        str     r4, [r7]
        sbc     r3, r1, r3
        str     r3, [r7, #4]
        ldr     r3, [r7, #120]
        ldrd    r1, [r7]
        strd    r1, [r3]
        ldr     r3, [r7, #124]
        movs    r2, #0
        str     r2, [r3]
.L6:
        nop
        adds    r7, r7, #76
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r7, r8, r9, r10, fp}
        bx      lr
        .size   mmm_step, .-mmm_step
        .align  1
        .global mmm_opt
        .syntax unified
        .thumb
        .thumb_func
        .type   mmm_opt, %function
mmm_opt:
        @ args = 12, pretend = 0, frame = 232
        @ frame_needed = 1, uses_anonymous_args = 0
        push    {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        sub     sp, sp, #260
        add     r7, sp, #24
        strd    r0, [r7, #152]
        strd    r2, [r7, #144]
        movs    r3, #0
        str     r3, [r7, #172]
        mov     r2, #0
        mov     r3, #0
        strd    r2, [r7, #160]
        ldrd    r2, [r7, #144]
        and     r4, r2, #1
        movs    r5, #0
        strd    r4, [r7, #208]
        ldrd    r2, [r7, #152]
        strd    r2, [r7, #224]
        movs    r3, #0
        str     r3, [r7, #220]
        b       .L8
.L9:
        ldrd    r2, [r7, #224]
        and     r3, r2, #1
        str     r3, [r7, #72]
        movs    r4, #0
        str     r4, [r7, #76]
        ldrd    r2, [r7, #72]
        strd    r2, [r7, #184]
        ldrd    r2, [r7, #224]
        mov     r0, #0
        mov     r1, #0
        lsrs    r0, r2, #1
        orr     r0, r0, r3, lsl #31
        lsrs    r1, r3, #1
        strd    r0, [r7, #224]
        ldrd    r2, [r7, #160]
        and     r3, r2, #1
        str     r3, [r7, #136]
        str     r4, [r7, #140]
        ldrd    r0, [r7, #184]
        ldrd    r2, [r7, #208]
        and     r5, r0, r2
        str     r5, [r7, #128]
        ands    r3, r3, r1
        str     r3, [r7, #132]
        ldrd    r5, [r7, #136]
        mov     r3, r5
        ldrd    r0, [r7, #128]
        mov     r2, r0
        eors    r3, r3, r2
        str     r3, [r7, #64]
        mov     r3, r6
        mov     r2, r1
        eors    r3, r3, r2
        str     r3, [r7, #68]
        ldrd    r2, [r7, #64]
        strd    r2, [r7, #176]
        add     r3, r7, #172
        str     r3, [sp, #20]
        add     r3, r7, #160
        str     r3, [sp, #16]
        ldrd    r2, [r7, #272]
        strd    r2, [sp, #8]
        ldrd    r2, [r7, #176]
        strd    r2, [sp]
        ldrd    r2, [r7, #144]
        ldrd    r0, [r7, #184]
        bl      mmm_step(PLT)
        ldrd    r2, [r7, #224]
        and     r3, r2, #1
        str     r3, [r7, #56]
        str     r4, [r7, #60]
        ldrd    r2, [r7, #56]
        strd    r2, [r7, #184]
        ldrd    r2, [r7, #224]
        mov     r0, #0
        mov     r1, #0
        lsrs    r0, r2, #1
        orr     r0, r0, r3, lsl #31
        lsrs    r1, r3, #1
        strd    r0, [r7, #224]
        ldrd    r2, [r7, #160]
        and     r3, r2, #1
        str     r3, [r7, #120]
        str     r4, [r7, #124]
        ldrd    r0, [r7, #184]
        ldrd    r2, [r7, #208]
        and     r5, r0, r2
        str     r5, [r7, #112]
        ands    r3, r3, r1
        str     r3, [r7, #116]
        ldrd    r5, [r7, #120]
        mov     r3, r5
        ldrd    r0, [r7, #112]
        mov     r2, r0
        eors    r3, r3, r2
        str     r3, [r7, #48]
        mov     r3, r6
        mov     r2, r1
        eors    r3, r3, r2
        str     r3, [r7, #52]
        ldrd    r2, [r7, #48]
        strd    r2, [r7, #176]
        add     r3, r7, #172
        str     r3, [sp, #20]
        add     r3, r7, #160
        str     r3, [sp, #16]
        ldrd    r2, [r7, #272]
        strd    r2, [sp, #8]
        ldrd    r2, [r7, #176]
        strd    r2, [sp]
        ldrd    r2, [r7, #144]
        ldrd    r0, [r7, #184]
        bl      mmm_step(PLT)
        ldrd    r2, [r7, #224]
        and     r3, r2, #1
        str     r3, [r7, #40]
        str     r4, [r7, #44]
        ldrd    r2, [r7, #40]
        strd    r2, [r7, #184]
        ldrd    r2, [r7, #224]
        mov     r0, #0
        mov     r1, #0
        lsrs    r0, r2, #1
        orr     r0, r0, r3, lsl #31
        lsrs    r1, r3, #1
        strd    r0, [r7, #224]
        ldrd    r2, [r7, #160]
        and     r3, r2, #1
        str     r3, [r7, #104]
        str     r4, [r7, #108]
        ldrd    r0, [r7, #184]
        ldrd    r2, [r7, #208]
        and     r5, r0, r2
        str     r5, [r7, #96]
        ands    r3, r3, r1
        str     r3, [r7, #100]
        ldrd    r5, [r7, #104]
        mov     r3, r5
        ldrd    r0, [r7, #96]
        mov     r2, r0
        eors    r3, r3, r2
        str     r3, [r7, #32]
        mov     r3, r6
        mov     r2, r1
        eors    r3, r3, r2
        str     r3, [r7, #36]
        ldrd    r2, [r7, #32]
        strd    r2, [r7, #176]
        add     r3, r7, #172
        str     r3, [sp, #20]
        add     r3, r7, #160
        str     r3, [sp, #16]
        ldrd    r2, [r7, #272]
        strd    r2, [sp, #8]
        ldrd    r2, [r7, #176]
        strd    r2, [sp]
        ldrd    r2, [r7, #144]
        ldrd    r0, [r7, #184]
        bl      mmm_step(PLT)
        ldrd    r2, [r7, #224]
        and     r3, r2, #1
        str     r3, [r7, #24]
        str     r4, [r7, #28]
        ldrd    r2, [r7, #24]
        strd    r2, [r7, #184]
        ldrd    r2, [r7, #224]
        mov     r0, #0
        mov     r1, #0
        lsrs    r0, r2, #1
        orr     r0, r0, r3, lsl #31
        lsrs    r1, r3, #1
        strd    r0, [r7, #224]
        ldrd    r2, [r7, #160]
        and     r3, r2, #1
        str     r3, [r7, #88]
        str     r4, [r7, #92]
        ldrd    r0, [r7, #184]
        ldrd    r2, [r7, #208]
        and     r10, r0, r2
        and     fp, r1, r3
        ldrd    r1, [r7, #88]
        mov     r3, r1
        eor     r3, r3, r10
        str     r3, [r7, #16]
        mov     r3, r2
        eor     r3, r3, fp
        str     r3, [r7, #20]
        ldrd    r3, [r7, #16]
        strd    r3, [r7, #176]
        add     r3, r7, #172
        str     r3, [sp, #20]
        add     r3, r7, #160
        str     r3, [sp, #16]
        ldrd    r2, [r7, #272]
        strd    r2, [sp, #8]
        ldrd    r2, [r7, #176]
        strd    r2, [sp]
        ldrd    r2, [r7, #144]
        ldrd    r0, [r7, #184]
        bl      mmm_step(PLT)
        ldr     r3, [r7, #220]
        adds    r3, r3, #4
        str     r3, [r7, #220]
.L8:
        ldr     r3, [r7, #280]
        subs    r2, r3, #3
        ldr     r3, [r7, #220]
        cmp     r3, r2
        blt     .L9
        b       .L10
.L11:
        ldrd    r2, [r7, #224]
        and     r3, r2, #1
        str     r3, [r7, #8]
        movs    r4, #0
        str     r4, [r7, #12]
        ldrd    r2, [r7, #8]
        strd    r2, [r7, #200]
        ldrd    r0, [r7, #224]
        mov     r2, #0
        mov     r3, #0
        lsrs    r2, r0, #1
        orr     r2, r2, r1, lsl #31
        lsrs    r3, r1, #1
        strd    r2, [r7, #224]
        ldrd    r2, [r7, #160]
        and     r3, r2, #1
        str     r3, [r7, #80]
        str     r4, [r7, #84]
        ldrd    r0, [r7, #200]
        ldrd    r2, [r7, #208]
        and     r8, r0, r2
        and     r9, r1, r3
        ldrd    r1, [r7, #80]
        mov     r3, r1
        eor     r3, r3, r8
        str     r3, [r7]
        mov     r3, r2
        eor     r3, r3, r9
        str     r3, [r7, #4]
        ldrd    r3, [r7]
        strd    r3, [r7, #192]
        add     r3, r7, #172
        str     r3, [sp, #20]
        add     r3, r7, #160
        str     r3, [sp, #16]
        ldrd    r2, [r7, #272]
        strd    r2, [sp, #8]
        ldrd    r2, [r7, #192]
        strd    r2, [sp]
        ldrd    r2, [r7, #144]
        ldrd    r0, [r7, #200]
        bl      mmm_step(PLT)
        ldr     r3, [r7, #220]
        adds    r3, r3, #1
        str     r3, [r7, #220]
.L10:
        ldr     r2, [r7, #220]
        ldr     r3, [r7, #280]
        cmp     r2, r3
        blt     .L11
        ldrd    r2, [r7, #160]
        mov     r0, r2
        mov     r1, r3
        adds    r7, r7, #236
        mov     sp, r7
        @ sp needed
        pop     {r4, r5, r6, r7, r8, r9, r10, fp, pc}
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
        bne     .L14
        mov     r2, #0
        mov     r3, #0
        b       .L15
.L14:
        ldrd    r2, [r7]
        orrs    r3, r3, r2
        bne     .L16
        mov     r0, #1
        mov     r1, #0
        ldrd    r2, [r7, #88]
        bl      __aeabi_uldivmod(PLT)
        b       .L15
.L16:
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
        beq     .L17
        clz     r3, r3
        b       .L18
.L17:
        clz     r3, r2
        adds    r3, r3, #32
.L18:
        rsb     r3, r3, #64
        str     r3, [r7, #28]
        ldrd    r2, [r7, #32]
        strd    r2, [r7, #48]
        ldr     r3, [r7, #28]
        subs    r3, r3, #2
        str     r3, [r7, #44]
        b       .L19
.L21:
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
        beq     .L20
        ldr     r3, [r7, #96]
        str     r3, [sp, #8]
        ldrd    r2, [r7, #88]
        strd    r2, [sp]
        ldrd    r2, [r7, #32]
        ldrd    r0, [r7, #48]
        bl      mmm_opt(PLT)
        strd    r0, [r7, #48]
.L20:
        ldr     r3, [r7, #44]
        subs    r3, r3, #1
        str     r3, [r7, #44]
.L19:
        ldr     r3, [r7, #44]
        cmp     r3, #0
        bge     .L21
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
.L15:
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