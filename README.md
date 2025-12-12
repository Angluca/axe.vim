#### Vim plugin for axe language
https://axelang.org
```vim
Plug 'angluca/axe.vim'
```
Set lsp if you want
```vim
Plug 'yegappan/lsp'

setl omnifunc=LspOmniFunc
au filetype axe call LspAddServer([#{
            \    name: 'axe',
            \    filetype: ['axe'],
            \    path: 'axels',
            \  }])
```

