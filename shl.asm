; # SHL

; # SHR

    ; Unsigned shifts.

    ; Application:

    ; -   quick unsigned multiply and divide by powers of 2.

%include "lib/asm_io.inc"

ENTRY
    mov eax, 0x81

    shl al, 1
    ASSERT_FLAG jc
    ASSERT_EQ 2

    shl al, 1
    ASSERT_EQ 4
    ASSERT_FLAG jnc

    shr al, 1
    ASSERT_EQ 2
    ASSERT_FLAG jnc

    mov cl, 2
    shr al, cl
    ASSERT_FLAG jc
    ASSERT_EQ 0

    ;ERROR:
    ;shift must be either const or in `cl`
    ;mov bl, 2
    ;shr ax, bl

    EXIT
