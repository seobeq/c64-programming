
; ----------------------------------------
; basic loader
; ----------------------------------------
*= $801
.word (+), 10
.null $9e, "4096"
+ .word 0
; ----------------------------------------
; labels
; ----------------------------------------
* = $1000
background = $d020
border = $d021
sprite_on = $d015
sprite_point_0 = $07f8
sprite_point_1 = $07f9 
sprite_point_2 = $07fa
sprite_point_3 = $07fb
x0_coord = $d000
y0_coord = $d001
x1_coord = $d002
y1_coord = $d003
x2_coord = $d004
y2_coord = $d005
x3_coord = $d006
y3_coord = $d007
sprite0_col = $d027
sprite1_col = $d028
sprite2_col = $d029
sprite3_col = $d02a
expand_x = $d017
expand_y = $d01d
screen_refresh = $d012
scankey = $ff9f
inkey = $ffe4
msb_x = $d010
flip = $fc 
frame = $fb
screen = $0d00
; ----------------------------------------
; clear screen
; ----------------------------------------
	lda #$00
	sta background
	sta border
	tax
	lda #$20
clrLoop:
	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x
	dex
	bne clrLoop
; ----------------------------------------
; sprite set up
; ----------------------------------------
	lda #$00
	sta msb_x
	lda #$0f
	sta sprite_on
	lda #$81
	sta sprite_point_0
	lda #$82
	sta sprite_point_1
	lda #$82
	sta sprite_point_2
	lda #$80
	sta sprite_point_3
	
	lda #$00
	sta x0_coord
	lda #$50
	sta y0_coord
	
	lda #$20
	sta x1_coord
	lda #$70
	sta y1_coord
	
	lda #$40
	sta x2_coord
	lda #$90
	sta y2_coord
	
	lda #$60
	sta x3_coord
	lda #$b0
	sta y3_coord
	
	lda #$06
	sta sprite0_col
	lda #$09
	sta sprite1_col
	lda #$7
	sta sprite2_col
	lda #$04
	sta sprite3_col
	lda #$0f
	sta expand_x
	sta expand_y
; ----------------------------------------
; game loop
; ----------------------------------------
wait:	
	lda $d012
	cmp #$30
	beq fly
	jmp wait
fly:	
	ldx x0_coord	
	inx
	stx x0_coord	
	;cpx #$ff							
	;beq setbit						
	ldx x1_coord	
	dex
	stx x1_coord	
	ldx x2_coord	
	inx
	stx x2_coord	
	ldx x3_coord	
	dex
	stx x3_coord
	ldx #$ff
slow:	
	dex
	cpx #$00
	bne slow
	jmp wait

;setbit:	
;	lda #$01	
;	sta msb_x	
;	jmp wait
	
*=$2000
.byte 0,0,0
.byte 0,16,0
.byte 0,16,0
.byte 125,221,64
.byte 17,85,64
.byte 17,221,192
.byte 16,0,64
.byte 16,1,192
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0
.byte 0,0,0  

* = $2040
.byte  0,80,0
.byte  15,255,128
.byte  24,0,192
.byte  31,255,192
.byte  24,32,192
.byte  24,32,192
.byte  24,32,192
.byte  31,255,192
.byte  24,32,192
.byte  24,32,192
.byte  24,32,192
.byte  31,255,192
.byte  24,32,192
.byte  24,32,192
.byte  24,32,192
.byte  31,255,192
.byte  24,32,192
.byte  24,32,192
.byte  24,32,192
.byte  63,255,224
.byte  0,0,0

* = $2080
.byte 0,240,0
.byte 1,136,0
.byte 1,20,0
.byte 0,132,0
.byte 0,200,0
.byte 0,176,0
.byte 0,144,0
.byte 0,144,0
.byte 0,144,0
.byte 0,144,0
.byte 0,144,0
.byte 1,144,0
.byte 1,12,0
.byte 1,4,0
.byte 2,6,0
.byte 2,33,0
.byte 4,49,0
.byte 6,81,0
.byte 3,142,0
.byte 0,0,0
.byte 0,0,0