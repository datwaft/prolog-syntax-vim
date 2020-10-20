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
  if exists("b:current_syntax")
    finish
  endif
" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                       General keywords                                       ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                       True keywords                                        │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax keyword PLTrue true

    highlight PLTrue ctermfg=green cterm=italic
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                       False keywords                                       │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax keyword PLFalse false fail

    highlight PLFalse ctermfg=red cterm=italic
" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                       General matches                                        ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Operator                                          │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match PLOperator '[\x21-\x40]'

    highlight link PLOperator Operator
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                            Atom                                            │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match PLAtom '\[\]'
    syntax match PLAtom '[a-z]\w*'
    syntax match PLAtom "'.*'"

    highlight link PLAtom Identifier
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Variable                                          │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match PLVariable '[A-Z][A-Za-z0-9_]*'

    highlight link PLVariable Type
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                     Anonymous Variable                                     │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match PLAnonymousVariable '_[A-Za-z0-9_]*'

    highlight link PLAnonymousVariable Comment
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Functor                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match PLFunctor '[a-z]\w*\((\)\@='
    syntax match PLFunctor "'.*'\((\)\@="

    highlight link PLFunctor Function
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Numbers                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    " e.g. 1234
    syntax match PLNumber '\d\+'
    " e.g. +1234 or -1234
    syntax match PLNumber '[-+]\d\+'
    " e.g. 1234.1234
    syntax match PLFloat '\d\+\.\d\+'
    " e.g. +1234.1234 or -1234.1234
    syntax match PLFloat '[-+]\d\+\.\d\+'
    " e.g. .1234
    syntax match PLFloat '\.\d\+'

    highlight link PLNumber Number
    highlight link PLFloat Float
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Strings                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax region PLString start='"' end='"'

    highlight link PLString String
  " ┌────────────────────────────────────────────────────────────────────────────────────────────┐ "
  " │                                          Comment                                           │ "
  " └────────────────────────────────────────────────────────────────────────────────────────────┘ "
    syntax match PLComment "%.*$"

    highlight link PLComment Comment
" ╔══════════════════════════════════════════════════════════════════════════════════════════════╗ "
" ║                                         Finalization                                         ║ "
" ╚══════════════════════════════════════════════════════════════════════════════════════════════╝ "
  let b:current_syntax = "prolog"
