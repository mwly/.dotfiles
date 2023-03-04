# .dotfiles

These are the dotfiles that it back up here

@mwly 

use stow <Dir> to install the path one path above
eg.   ~/dotfiles/nvim/.config/...  ->  ~/.config/...



## vim mappings
* <C-vimkeys>: select window in direction
* Tab/S-Tab: navigate dropdown
* F5: Open/Close Undotree 
* F9: invoke makefile
* leader +
    * h/l: select next tab
    * n: open nerdtree
    * tr: open terminal on the right
    * tu: open terminal underneath
    * a: autoformat
    * ff: fuzzyfind grep current buffer
    * fg: fuzzyfind all git-tracked files
    * fh: fuzzyfind all help_tags
    * m: everything vimtex
    * ml: tex-compile
    * mv: texpreview
    * c: coc-codeaction
    * pr: run python code
    * gr: run go code
    * gd: open go-doc
    * gs: go to go-def
    * gt: go to type definition
    * gi: go to implementation
    * rr: rust-run


ToDo: 
* Catch all Runner logic
* expand dot folders for stows option "--dotfiles"
* Plugs to consider:
    * Harpoon
    * subsitute coc for tree-sitter
    * 
