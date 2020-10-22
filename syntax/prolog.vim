" Vim Syntax File
"
" Language: Prolog
" Maintainers: datwaft <github.com/datwaft>
" Created: 2020-10-19
" Changed: 2020-10-21
" Remark: This prolog file differentiates between functors and normal atoms.

" => Initialization
if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match
" => Language definition
  " -> Keywords
    syntax keyword prologKeywordTrue true
    syntax keyword prologKeywordFalse false fail
    syntax cluster prologKeywords contains=prologKeywordFalse,prologKeywordTrue
  " -> Operator
    syntax match prologOperator ';'
    syntax match prologOperator '|'
    syntax match prologOperator ','
    syntax match prologOperator '->'
    syntax match prologOperator '*->'
    syntax match prologOperator ':='
    syntax match prologOperator '\\+'
    syntax match prologOperator '<'
    syntax match prologOperator '='
    syntax match prologOperator '=\.\.'
    syntax match prologOperator '=@='
    syntax match prologOperator '\\=@='
    syntax match prologOperator '=:='
    syntax match prologOperator '=<'
    syntax match prologOperator '=='
    syntax match prologOperator '=\\='
    syntax match prologOperator '>'
    syntax match prologOperator '>='
    syntax match prologOperator '@<'
    syntax match prologOperator '@=<'
    syntax match prologOperator '@>'
    syntax match prologOperator '@>='
    syntax match prologOperator '\\='
    syntax match prologOperator '\\=='
    syntax keyword prologOperator as is
    syntax match prologOperator '>:<'
    syntax match prologOperator ':<'
    syntax match prologOperator '#='
    syntax match prologOperator ':'
    syntax match prologOperator '+'
    syntax match prologOperator '-'
    syntax match prologOperator '\/\\'
    syntax match prologOperator '\\\/'
    syntax keyword prologOperator xor
    syntax match prologOperator '?'
    syntax match prologOperator '\*'
    syntax match prologOperator '\/'
    syntax match prologOperator '\/\/'
    syntax match prologOperator '<<'
    syntax match prologOperator '>>'
    syntax keyword prologOperator div rdiv mod rem
    syntax match prologOperator '\*\*'
    syntax match prologOperator '\^'
    syntax match prologOperator '\\'
    syntax match prologOperator '\.'
    syntax match prologOperator '$'
    syntax match prologOperator '[()]'
    syntax match prologOperator '[{\}]'
    syntax match prologSpecialOperator '!'
    syntax cluster prologOperators contains=prologOperator,prologSpecialOperator
  " -> Atom
    syntax match prologAtom '\[\]'
    syntax match prologAtom '[a-z]\w*'
    syntax match prologAtom "'.*'"
  " -> Numbers
    syntax match prologNumber '\d\+'
    syntax match prologNumber '[-+]\d\+'
    syntax match prologFloat '\d\+\.\d\+'
    syntax match prologFloat '[-+]\d\+\.\d\+'
    syntax match prologFloat '\.\d\+'
    syntax cluster prologNumbers contains=prologNumber,prologFloat
  " -> List
    syntax match prologList '\[.\{-}\]' contains=prologListDivisor,prologListDelimiter,@prologAll
    syntax match prologListDivisor '[,|]' contained
    syntax match prologListDelimiter '[\[\]]' contained
  " -> Fuctor
    " Functor Group
      syntax match prologFunctorGroup '[a-z]\w*(.\{-})' contains=prologFunctor,prologParameters
      syntax match prologFunctorGroup "'.\{-}'(.\{-})" contains=prologFunctor,prologParameters
    " Functor
      syntax match prologFunctor '[a-z]\w*\((\)\@=' contained containedin=prologFunctorGroup nextgroup=prologParameters
      syntax match prologFunctor "'.*'\((\)\@=" contained containedin=prologFunctorGroup nextgroup=prologParameters
    " Parameters
      syntax match prologParameters '(.\{-})' contained containedin=prologFunctorGroup contains=@prologAll,prologParameterDivisor,prologParameterDelimiter
      syntax match prologParameterDivisor ',' contained containedin=prologParameters
      syntax match prologParameterDelimiter '[()]' contained containedin=prologParameters
  " -> Variables
    " Varable
      syntax match prologVariable '[A-Z][A-Za-z0-9_]*'
    " Anonymous Variable
      syntax match prologAnonymousVariable '_[A-Za-z0-9_]*'
    syntax cluster prologVariables contains=prologVariable,prologAnonymousVariable
  " -> String
    syntax region prologString start='"' end='"'
  " -> Body
    " Normal Body
      syntax match prologBody ':-.\{-}\.' contains=@prologAll,prologBodyDelimiter
      syntax match prologBody '?-.\{-}\.' contains=@prologAll,prologBodyDelimiter
      syntax match prologBodyDelimiter ':-' contained containedin=prologBody
      syntax match prologBodyDelimiter '?-' contained containedin=prologBody
      syntax match prologBodyDelimiter '\.' contained containedin=prologBody
    " DCG Body
      syntax match prologDCGBody '-->.\{-}\.' contains=@prologAll,prologDCGBodyDivisor,prologDCGBodyDelimiter
      syntax match prologDCGBodyDivisor '[{\}]' contained containedin=prologDCGBody
      syntax match prologDCGBodyDelimiter '-->' contained containedin=prologDCGBody
      syntax match prologDCGBodyDelimiter '\.' contained containedin=prologDCGBody
  " -> Comment
    syntax match prologComment "%.*$"
    syntax region prologCComment fold start=/\/\*/ end=/\*\//
    syntax cluster prologComments contains=prologComment,prologCComment
  " -> All
    syntax cluster prologAll contains=@prologKeywords,@prologOperators,prologAtom,@prologNumbers,prologList,prologFunctorGroup,@prologVariables,prologString
" => Color definition
  " -> Keywords
    highlight prologKeywordTrue ctermfg=green cterm=italic guifg=#C3E88D gui=italic
    highlight prologKeywordFalse ctermfg=red cterm=italic guifg=#FF5370 gui=italic
  " -> Operators
    highlight prologOperator ctermfg=cyan guifg=#89DDFF
    highlight prologSpecialOperator ctermfg=red cterm=bold guifg=#FF5370 gui=bold
  " -> Atoms
    highlight link prologAtom Define
  " -> Numbers
    highlight link prologNumber Number
    highlight link prologFloat Float
  " -> Lists
    highlight prologListDivisor ctermfg=blue cterm=bold guifg=#82AAFF gui=bold
    highlight prologListDelimiter ctermfg=blue cterm=bold guifg=#82AAFF gui=bold
  " -> Functors
    highlight link prologFunctor Function
  " -> Varables
    highlight prologVariable ctermfg=yellow cterm=bold guifg=#FFCB6B gui=bold
  " -> Anonymous Variables
    highlight prologAnonymousVariable ctermfg=yellow cterm=italic guifg=#FFCB6B gui=italic
  " -> Parameters
    highlight prologParameterDivisor ctermfg=red cterm=bold guifg=#FF5370 gui=bold
    highlight prologParameterDelimiter ctermfg=red cterm=bold guifg=#FF5370 gui=bold
  " -> Strings
    highlight link prologString String
  " -> Body
    highlight prologBodyDelimiter ctermfg=cyan cterm=bold guifg=#89DDFF gui=bold
    highlight prologDCGBodyDivisor ctermfg=cyan cterm=bold guifg=#89DDFF gui=bold
    highlight prologDCGBodyDelimiter ctermfg=cyan cterm=bold guifg=#89DDFF gui=bold
  " -> Comments
    highlight link prologComment Comment
    highlight link prologCComment Comment
" => Finalization
let b:current_syntax = "prolog"

