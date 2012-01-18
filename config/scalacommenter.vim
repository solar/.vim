autocmd MyAutoCmd FileType scala source $HOME/.vim/bundle/scalacommenter.vim/plugin/scalacommenter.vim
autocmd MyAutoCmd FileType scala map <Space>sc :call ScalaCommentWriter()<CR>
autocmd MyAutoCmd FileType scala map <Space>sf :call ScalaCommentFormatter()<CR>
autocmd MyAutoCmd FileType scala let b:scommenter_class_author='solar <github@sazabi.org>'
autocmd MyAutoCmd FileType scala let b:scommenter_file_author='solar <github@sazabi.org>'
autocmd MyAutoCmd FileType scala let b:scommenter_class_version = '1.0, ' . strftime("%Y/%m/%d")
autocmd MyAutoCmd FileType scala let b:scommenter_file_copyright_line = ''
autocmd MyAutoCmd FileType scala let b:scommenter_company_name = 'Insprout, Inc.'
autocmd MyAutoCmd FileType scala let b:scommenter_file_copyright_list = [
\    'Copyright 2012 ' . b:scommenter_company_name . 'All rights reserved',
\    'PPOPRIETARY/CONFIDENTIAL, Use is subject to licence terms.'
\]
autocmd MyAutoCmd FileType scala let b:scommenter_extra_line_text_offset = 20
autocmd MyAutoCmd FileType scala let b:scommenter_file_noautotime = 1
