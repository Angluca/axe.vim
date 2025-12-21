if exists("b:current_syntax")
    finish
endif

syn keyword axeKeyword def val const static pub
syn keyword axeKeyword model enum union
syn keyword axeKeyword parallel overload single

syn keyword axeType bool char rchar byte void string ptrdiff untyped typed
syn keyword axeType i8 i16 i32 i64 u8 u16 u32 u64 isize usize
syn keyword axeType int uint long ulong
syn keyword axeType float f32 f64

syn keyword axeSelf self
syn keyword axeLabel mut default ref as
syn keyword axeOperator and or is
syn keyword axeConstant true false null nil
syn keyword axeSComment assert println print
syn match   axeSMacro   '\v<(put)>'
syn match   axeNew      '\v<(new|[m]?alloc|create)>'
syn match   axeFree     '\v<(free)>'

syn keyword axeRepeat while loop for in to
syn keyword axeStatement break continue return
syn keyword axeConditional if else elif switch case
syn keyword axeInclude export include extern when foreign opaque

syn keyword axeException throw try catch cast unsafe raw
syn keyword axePanic panic enforce
"syn keyword axeSuper   private

syn match axePreProc    '[@]'
syn match axeSymbol     '[,;:\.]'
syn match axeOperator   '[\+\-\%=\/\^\&\*!?><\$|~]'
syn match axeConstant   '[{}\[\]()]'
syn match axeType       '\v\(@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\)' " (type*)
syn match axeType       '\v\[@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\]' " [type*]
syn match axeType       '\v<\w+_[tscemui]>'
syn match axeMacro      '\v<[_]*\u[A-Z0-9_]*>'
syn match axeType       '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
syn match axeType       '\v\.?\zs<([iu][0-9]{1,3})?>'
syn match axeRepeat     '\v([^\.](\.|::|-\>))@<=\w\w*'
syn match axeType       '\v<\w+>\ze(::|\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
syn match axeFunc       '\v[_]*\l\w*\ze((\[.*\])|((::)?\<.*\>))*\s*\('

syn match axeException  '\v(\W@<=[~&*]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[*]+\ze\W)'
syn match axeStruct     '\v((type|model|struct|enum|union)(\[.*\])?\s*)@<=[_]*\w+\ze(\[.*\])?\s*(\(|\{)'

syn match axeInclude    '\v^\s*use .*[^(]'
syn match axeMacro      '\v^\s*\[.{-}\]'
syn match axeType       '\v<(str)\ze\s*\('
syn match axeSMacro     '\v<(reduce|deref|list)\ze\s*\('
syn match axeLabel      '\v<(addr)\ze\s*\('
syn match axeAdded      '\v^\s*<(test)\ze\s*\{'

" -- shader
"syn keyword axeKeyword  uniform instance varying var
"syn keyword axeKeyword  vertex fragment
"syn keyword axeType     texture texture2D
syn match   axeType     '\v<bool[234]?>'
syn match   axeType     '\v<int[234]?>'
syn match   axeType     '\v<uint[234]?>'
syn match   axeType     '\v<half[234]?>'
syn match   axeType     '\v<float([234](x[234])?)?>'
syn match   axeType     '\v<[dbui]?vec[234]>'
syn match   axeType     '\v<vec[234][dbfhui]?>'
syn match   axeType     '\v<mat[234](x[234]f)?>'
syn match   Keyword     '\v^<(in|out)>'

"hi def axeSymbol ctermfg=DarkGray guifg=DarkGray
hi def link axeSMacro   SpecialComment
hi def link axeNew      Added
hi def link axeFree     Exception
hi def link axeTitle    Title
hi def link axeAdded    Added
hi def link axeStruct   Changed
hi def link axeConstant Constant
hi def link axeSymbol   Changed
hi def link axeMacro    Macro
hi def link axeSComment SpecialComment
hi def link axeFunc     Function
hi def link axeTypedef  Changed
"hi def axeType ctermfg=DarkCyan guifg=DarkCyan
hi def link axeType     MoreMsg
"hi def link axeType SpecialComment
"hi def axeSelf ctermfg=DarkMagenta guifg=DarkMagenta
hi def link axeSelf     Label
hi def link axeModeMsg  ModeMsg

syn match  axeSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  axeSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  axeCharacter        "'[^']*'" contains=axeSpecialChar,axeSpecialCharError
syn match  axeCharacter        "'\\''" contains=axeSpecialChar
syn match  axeCharacter        "'[^\\]'"

"syn region    axeString      matchgroup=axeString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=axeEscape,@Spell
syn region    axeString      matchgroup=axeString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region    axeString      matchgroup=axeString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match axeNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match axeNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match axeFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match axeFloat  '\v<([0][1-9]*)([eE][+-]?\d+)?[fFdD]?>' display
syn match axeFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match axeInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match axeInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match axeInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match axeInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match axeFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match axeFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match axeFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match axeFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match axeEscape '\\[\\'"0abfnrtv]' contained display
syn match axeEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match axeFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=axeEscape display
syn match axeFormat '{{\|}}' contained display


hi def link axePreProc               PreProc
hi def link axeSuper                 Title
hi def link axeFloat                 Constant
hi def link axeInteger               Number
hi def link axeEscape                SpecialComment
hi def link axeFormat                SpecialChar

hi def link axeKeyword               Keyword
hi def link axeInclude               Include
hi def link axeLabel                 Label
hi def link axeConditional           Conditional
hi def link axeRepeat                Repeat
hi def link axeStatement             Statement
"hi def link axeType                  Type
hi def link axeNumber                Number
hi def link axeComment               Comment
hi def link axeOperator              Operator
hi def link axeCharacter             Character
hi def link axeString                String
hi def link axeTodo                  Todo
hi def link axeSpecial               Special
hi def link axeSpecialError          Error
hi def link axeSpecialCharError      Error
hi def link axeString                String
hi def link axeCharacter             Character
hi def link axeSpecialChar           SpecialChar
hi def link axeException             Exception
hi def link axePanic                 Exception

syn match   axeTypedef  contains=axeTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match   axeFunc     "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn keyword axeKeyword union struct model enum type nextgroup=axeTypedef skipwhite skipempty
syn keyword axeKeyword union nextgroup=axeType skipwhite skipempty contained
syn keyword axeMacro platform macro nextgroup=axeTypedef skipwhite skipempty
" adapted from neovim runtime/syntax
syn keyword axeTodo contained TODO FIXME XXX NOTE
syn region  axeComment  start="/\*" end="\*/" contains=axeTodo,@Spell
syn match   axeComment  "//.*$" contains=axeTodo,@Spell
syn match   axePreProc  '\#.*$'

let b:current_syntax = "axe"
