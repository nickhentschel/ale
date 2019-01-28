" Description: Fixing Markdown files with remark.

call ale#Set('remark_executable', 'remark')
call ale#Set('remark_use_global', 0)

function! ale#fixers#remark#GetExecutable(buffer) abort
      return ale#node#FindExecutable(a:buffer, 'remark', [
          \   'node_modules/remark-cli/cli.js',
          \   'node_modules/.bin/remark',
          \])
endfunction


function! ale#fixers#remark#Fix(buffer) abort
    let l:executable = ale#fixers#remark#GetExecutable(a:buffer)

    return {
    \   'command': ale#Escape(l:executable),
    \}
endfunction
