;   DB: write a specified byte
;   DW: write specified 2 bytes
;   DD: write specified 4 bytes
;   RESB: fill by 0

    DB      0xeb, 0x4e, 0x90
    DB      "HELLOUPL"          ;   name of boot sector
    DW      512                 ;   size of 1 sector
    DB      1                   ;   size of 1 cluster (1 sector)
    DW      1                   ;   sector where FAT starts (from 1 sector)
    DB      2                   ;   number of FAT
    DW      224                 ;   size of root directory area (2224 entries)
    DW      2880                ;   size of this drive (2880 sectors)
    DB      0xf0                ;   media type
    DW      9                   ;   length of FAT area (9 sectors)
    DW      18                  ;   number of sectors in 1 track (18 sectors)
    DW      2                   ;   number of heads
    DD      0                   ;   We don't use the partition, this must be 0.
    DD      2880                ;   size of this drive again
    DB      0, 0, 0x29          ;   ???
    DD      0xffffffff          ;   serial number of volume?
    DB      "HELLO-OS   "       ;   disk name
    DB      "FAT12   "          ;   name of the disk format
    RESB    18                  ;   18 bytes blank area

; program body
 
    DB      0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
    DB      0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
    DB      0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
    DB      0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
    DB      0xee, 0xf4, 0xeb, 0xfd

; message body

    DB      0x0a, 0x0a          ;   2 blank lines
    DB      "hello, world"
    DB      0x0a                ;   blank line
    DB      0

    RESB    0x1fe-($-$$)        ;   fill area to 0x01fe by 0x00         
    DB      0x55, 0xaa

    DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB    4600
    DB      0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
    RESB    1469432