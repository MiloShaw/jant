# jant
It is a script program for create Java project and compile it automatically

if you use VIM, add this into .vimrc
==================================================
nnoremap <F7> :call CompileAndRun()<CR>
function! CompileAndRun() 
    exec "w"
    if &filetype == 'sh'
        exec "!time python %"
    elseif &filetype == 'java'
        exec "!jant"
    endif

endfunction
function! JantCreateNewProject() 

    let project_name = input('Create Project: ') 
    echo " ... Done!" 
    exec '!jant -n ' project_name 

endfunction

command! JantNew :call JantCreateNewProject()
===================================================
