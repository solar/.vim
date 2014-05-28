set ts=2 sts=2 sw=2

call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
call smartinput#define_rule({
      \ 'at': '\({\|\<do\>\)\s*\%#',
      \ 'char': '<Bar>',
      \ 'input': '<Bar><Bar><Left>',
      \ 'filetype': ['ruby']})
