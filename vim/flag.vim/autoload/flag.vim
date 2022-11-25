let s:flagvalue = ""

function! flag#Flag(t)
    " Store current cursor line"
    let cursor = getpos(".")
    " Clear previous debug"
    call flag#DelFlag(a:t)
    " Back to cursor line 
    call setpos(".", cursor)

    if a:t=="green"
        " Set debug point 
        mark g
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagGreen file=' . expand("%:p")
    elseif a:t=="yellow"
        " Set debug point 
        mark y
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagYellow file=' . expand("%:p")
    elseif a:t=="orange"
        " Set debug point 
        mark o
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagOrange file=' . expand("%:p")
    elseif a:t=="red"
        " Set debug point 
        mark r
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagRed file=' . expand("%:p")
    endif
endfunc

function! flag#DelFlag(t)
    if a:t=="green"
        silent! 'g
        silent! exec 'sign unplace '.line(".")
        silent! delmark g
    elseif a:t=="yellow"
        silent! 'y
        silent! exec 'sign unplace '.line(".")
        silent! delmark y
    elseif a:t=="orange"
        silent! 'o
        silent! exec 'sign unplace '.line(".")
        silent! delmark o
    elseif a:t=="red"
        silent! 'r
        silent! exec 'sign unplace '.line(".")
        silent! delmark r
    endif
endfunc

function! flag#GoToFlag(t)
    if a:t=="green"
        silent! 'g
    elseif a:t=="yellow"
        silent! 'y
    elseif a:t=="orange"
        silent! 'o
    elseif a:t=="red"
        silent! 'r
    endif
endfunc

function! flag#GoToNextFlag()
    try 
        if s:flagvalue == ""
            try 
                let s:flagvalue = "green"
                'g
            catch 
                :call flag#GoToNextFlag()
            endtry
        elseif s:flagvalue == "green"
            try 
                let s:flagvalue = "yellow"
                'y
            catch 
                :call flag#GoToNextFlag()
            endtry 
        elseif s:flagvalue == "yellow"
            try 
                let s:flagvalue = "orange"
                'o
            catch 
                :call flag#GoToNextFlag()
            endtry 
        elseif s:flagvalue == "orange"
            try 
                let s:flagvalue = "red"
                'r
            catch 
                :call flag#GoToNextFlag()
            endtry
        elseif s:flagvalue == "red"
            try
                let s:flagvalue = "green"
                'g
            catch 
                :call flag#GoToNextFlag()
            endtry
        endif
    catch 
    endtry
endfunc

function! flag#RetrieveFlags()
    try  
        'g
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagGreen file=' . expand("%:p")
    catch
    endtry 

    try  
        'y
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagYellow file=' . expand("%:p")
    catch
    endtry 

    try  
        'o
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagOrange file=' . expand("%:p")
    catch
    endtry 

    try  
        'r
        silent! exec 'sign place '.line(".").' line='.line(".").' name=FlagRed file=' . expand("%:p")
    catch
    endtry 
endfunc
