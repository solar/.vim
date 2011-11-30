"
" Git-Vim settings
"

if has('win32') || has('win64')
    let g:git_bin = 'c:/tools/msysgit/bin/git.exe'
else
    let g:git_bin = 'git'
endif
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'

nmap        <Space>g        <SID>[git]
nnoremap    <SID>[git]d     :<C-u>GitDiff --cached<CR>
nnoremap    <SID>[git]D     :<C-u>GitDiff<CR>
nnoremap    <SID>[git]s     :<C-u>GitStatus<CR>
nnoremap    <SID>[git]l     :<C-u>GitLog<CR>
nnoremap    <SID>[git]L     :<C-u>GitLog -u \| head -10000<CR>
nnoremap    <SID>[git]a     :<C-u>GitAdd<CR>
nnoremap    <SID>[git]A     :<C-u>GitAdd <cfile><CR>
nnoremap    <SID>[git]c     :<C-u>GitCommit<CR>
nnoremap    <SID>[git]C     :<C-u>GitCommit --amend<CR>
nnoremap    <SID>[git]p     :<C-u>Git push<CR>

