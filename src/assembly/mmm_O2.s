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
student@armhf32:~/rsa-new$
student@armhf32:~/rsa-new$
student@armhf32:~/rsa-new$
student@armhf32:~/rsa-new$ cat mmm_optO2.s
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
student@armhf32:~/rsa-new$
student@armhf32:~/rsa-new$ cat mmm_O2.s
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