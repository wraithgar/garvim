" Vim syntax file
" Language: asm6 6502 assembler
" By: Gar
" Version 1.0.0

" Remove any old syntax stuff hanging about

syn clear
syn case ignore

" directives

syn match asm6Directive "\.byte"
syn match asm6Directive "\.pad"
syn match asm6Directive "\.base"
syn match asm6Directive "\.dw"
syn match asm6Directive "\.ds\?b"
syn match asm6Directive "DC\.B"
syn match asm6Directive "DC\.W"
syn match asm6Directive "DS\.B"
syn match asm6Directive "DS\.W"
syn keyword asm6Directive = ALIGN BASE BIN BYTE DB DCB DCW DH DL DSB DSW DW ELSE ELSEIF ENDE ENDIF ENDM ENDR ENUM EQU ERROR FILLVALUE HEX IF IFDEF IFNDEF INCBIN INCLUDE INCSRC MACRO ORG PAD REPT WORD


" registers

syn keyword asm6Reg x y a

" opcodes:

syn keyword asm6Op adc and asl bit brk clc cld cli clv cmp cpx cpy dec dex dey eor inc inx iny lda ldx ldy lsr nop ora pha php pla plp rol ror rti rts sbc sec sed sei sta stx sty tax tay tsx txa txs tya

syn keyword asm6Branch bcc bcs beq bmi bne bpl bvc bvs jmp jsr

" Atari 800XL 'Sally' undocumented opcodes
" mnemonics taken from Trevin Beattie's 'Atari Technical Information' page
" at "http://www.xmission.com/~trevin/atari/atari.shtml"
syn keyword asmSallyUndoc anc arr asr asx ax7 axe brk dcp jam las lax php rla rra sax slo sre sx7 sy7 xea xs7

" TODO absolute addressing: sta a:location
" TODO local label @tmp1:
syn match asmLabel "^[a-z_][a-z0-9_]*"
syn match asmComment ";.*"hs=s+1 contains=asmTodo
syn keyword asmTodo contained todo fixme xxx warning danger note notice bug
syn region asmString start=+"+ skip=+\\"+ end=+"+
syn keyword asmSettings opt org

syn match decNumber "\<\d\+\>"
syn match hexNumber "\$\x\+\>" " 'bug', but adding \< doesn't behave!
syn match binNumber "%[01]\+\>"
syn match asmImmediate "#\$\x\+\>"
syn match asmImmediate "#%[01]\+\>"
syn match asmImmediate "#\d\+\>"
syn match asmImmediate "<\$\x\+\>"
syn match asmImmediate "<\d\+\>"
syn match asmImmediate ">\$\x\+\>"
syn match asmImmediate ">\d\+\>"
syn match asmImmediate "#<\$\x\+\>"
syn match asmImmediate "#<\d\+\>"
syn match asmImmediate "#>\$\x\+\>"
syn match asmImmediate "#>\d\+\>"

"
"syn case match
if !exists("did_asm6_syntax_inits")
  let did_rgb_asm_syntax_inits = 1

  " The default methods for highlighting.  Can be overridden later
  hi link asmLabel Identifier
  hi link asmString String
  hi link asmComment Comment
  hi link asmSettings Statement
  hi link asm6Op Statement
  hi link asmSallyUndoc Special
  hi link asm6Reg Identifier
  hi link asm6Branch Conditional
  hi link asmTodo Debug

  hi link asmImmediate Special

  hi link hexNumber Number
  hi link binNumber Number
  hi link decNumber Number

  hi link asm6Directive Type

endif

let b:current_syntax = "rgbasm"
