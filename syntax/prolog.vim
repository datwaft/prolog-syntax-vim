" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                                                                              ║ "
" ║                 ooooooooo.                      oooo                                         ║ "
" ║                 `888   `Y88.                    `888                                         ║ "
" ║                  888   .d88' oooo d8b  .ooooo.   888   .ooooo.   .oooooooo                   ║ "
" ║                  888ooo88P'  `888""8P d88' `88b  888  d88' `88b 888' `88b                    ║ "
" ║                  888          888     888   888  888  888   888 888   888                    ║ "
" ║                  888          888     888   888  888  888   888 `88bod8P'                    ║ "
" ║                 o888o        d888b    `Y8bod8P' o888o `Y8bod8P' `8oooooo.                    ║ "
" ║                                                                 d"     YD                    ║ "
" ║                                                                 'Y88888P'                    ║ "
" ║               .oooooo..o                             .                                       ║ "
" ║              d8P'    `Y8                           .o8                                       ║ "
" ║              Y88bo.      oooo    ooo ooo. .oo.   .o888oo  .oooo.   oooo    ooo               ║ "
" ║               `"Y8888o.   `88.  .8'  `888P"Y88b    888   `P  )88b   `88b..8P'                ║ "
" ║                   `"Y88b   `88..8'    888   888    888    .oP"888     Y888'                  ║ "
" ║              oo     .d8P    `888'     888   888    888 . d8(  888   .o8"'88b                 ║ "
" ║              8""88888P'      .8'     o888o o888o   '888" `Y888""8o o88'   888o               ║ "
" ║                          .o..P'                                                              ║ "
" ║                          `Y8P'                                                               ║ "
" ║                                      Created by datwaft                                      ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "

" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                        Initialization                                        ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  if version < 600
    syn clear
  elseif exists("b:current_syntax")
    finish
  endif

  syntax case match
" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                       General keywords                                       ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                       True keywords                                        │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax keyword prologTrue true

    highlight prologTrue ctermfg=green cterm=italic guifg=#C3E88D gui=italic
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                       False keywords                                       │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax keyword prologFalse false fail

    highlight prologFalse ctermfg=red cterm=italic guifg=#FF5370 gui=italic
" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                       General matches                                        ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Operator                                          │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match prologOperator '-->'
    syntax match prologOperator ':-'
    syntax match prologOperator '?-'

    syntax keyword prologOperator dynamic discontiguous initialization meta_predicate module_transparent multifile public thread_local thread_initialization volatile

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

    syntax match prologSpecialOperator '!'

    highlight prologOperator ctermfg=cyan cterm=bold guifg=#89DDFF gui=bold
    highlight prologSpecialOperator ctermfg=red cterm=bold guifg=#FF5370 gui=bold
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                           Lists                                            │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax region prologList start=/\[/ end=/\]/ contains=prologListDelimiters,prologListRangeDelimiters,
      \@prologAll
    syntax match prologListDelimiters /[,|]/ contained
    syntax match prologListRangeDelimiters /[\[\]]/ contained

    highlight prologListDelimiters ctermfg=cyan cterm=bold guifg=#89DDFF gui=bold
    highlight prologListRangeDelimiters ctermfg=cyan cterm=bold guifg=#89DDFF gui=bold
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                            Atom                                            │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match prologAtom '\[\]'
    syntax match prologAtom '[a-z]\w*'
    syntax match prologAtom "'.*'"

    highlight link prologAtom Define
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Variable                                          │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match prologVariable '[A-Z][A-Za-z0-9_]*'

    highlight prologVariable ctermfg=yellow cterm=bold guifg=#FFCB6B gui=bold
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                     Anonymous Variable                                     │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match prologAnonymousVariable '_[A-Za-z0-9_]*'

    highlight prologAnonymousVariable ctermfg=yellow cterm=italic guifg=#FFCB6B gui=italic
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Functor                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match prologFunctor '[a-z]\w*\((\)\@='
    syntax match prologFunctor "'.*'\((\)\@="

    highlight link prologFunctor Function
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                         Arguments                                          │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax region prologArguments start=/(/  end=/)/ contains=prologArgumentsDelimiters,
      \prologArgumentsRangeDelimiters,@prologAll
    syntax match prologArgumentsDelimiters /[,]/ contained
    syntax match prologArgumentsRangeDelimiters /[()]/ contained

    highlight prologArgumentsDelimiters ctermfg=red cterm=bold guifg=#FF5370 gui=bold
    highlight prologArgumentsRangeDelimiters ctermfg=red cterm=bold guifg=#FF5370 gui=bold
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Numbers                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    " e.g. 1234
    syntax match prologNumber '\d\+'
    " e.g. +1234 or -1234
    syntax match prologNumber '[-+]\d\+'
    " e.g. 1234.1234
    syntax match prologFloat '\d\+\.\d\+'
    " e.g. +1234.1234 or -1234.1234
    syntax match prologFloat '[-+]\d\+\.\d\+'
    " e.g. .1234
    syntax match prologFloat '\.\d\+'

    highlight link prologNumber Number
    highlight link prologFloat Float
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Strings                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax region prologString start='"' end='"'

    highlight link prologString String
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Comment                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match prologComment "%.*$"
    syntax region prologCComment fold start=/\/\*/ end=/\*\//

    highlight link prologComment Comment
    highlight link prologCComment Comment
" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                           Clusters                                           ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  syntax cluster prologOperators contains=prologOperator,prologSpecialOperator
  syntax cluster prologKeywords contains=prologTrue,prologFalse
  syntax cluster prologNumbers contains=prologNumber,prologFloat
  syntax cluster prologVariables contains=prologVariable,prologAnonymousVariable
  syntax cluster prologComments contains=prologComment,prologCComment
  syntax cluster prologAll contains=@prologKeywords,@prologOperators,prologAtom,@prologVariables,prologFunctor,@prologNumbers,prologString,prologList,@prologComments,prologArguments,prologListDelimiters,prologListRangeDelimiters,prologArgumentsDelimiters,prologArgumentsRangeDelimiters
" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                         Finalization                                         ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  let b:current_syntax = "prolog"
