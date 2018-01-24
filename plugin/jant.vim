"================================================================
" Author : Milo Shaw  milo@deepsupport.org | milo@newlisp.cn |
" Update : 2018-01-23 01:17:27
"================================================================
"
func! CreateNewJavaProject()

    let l:name = input("Project Name: ")
    let l:orgs = split(input("Orgnization: "), '\W')
    let l:tmp_orgs = []
    
    for i in l:orgs
        try
            call insert(l:tmp_orgs, i)
        catch /.*/
            echo "Error: " v:exception
        endtry
    endfor
    
    let l:norgs = join(l:tmp_orgs, '.')
    redraw 
    echomsg "create project: ".l:name."... "."Done!"

    "create project and generate files.
    exec '!jant -n ' l:name l:norgs

endfunc

command! JantNew :call CreateNewJavaProject()
