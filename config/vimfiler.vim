nnoremap <Space>f :<C-u>VimFiler<CR>

let s:bundle = neobundle#get('vimfiler')
function! s:bundle.hooks.on_source(bundle)
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_trashbox_directory = expand("~/.vimfiler_trashbox")
endfunction
