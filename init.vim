" VimPlugin "
call plug#begin()

" Autopairs


Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these:q
Plug 'nvim-tree/nvim-web-devicons'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'danilamihailov/beacon.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'stevearc/aerial.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'folke/trouble.nvim'
call plug#end()

" Neovim Configs
set cursorline
hi CursorLine cterm=underline guibg=Grey20
set termguicolors
highlight! Pmenu guibg=#000000,guifg=#FFFFFF
set numberwidth=6
set rnu
set nu
highlight LineNr guifg=Grey30

hi NonText ctermfg=7 guifg=Grey30

" Initiate Lua Files
lua << EOF
require('nvimcmp')
require('others')
require('nvimpacker')
require("nvim-autopairs").setup {}
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
require("indent_blankline").setup {
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    }
require('catppuccin').setup {
flavour = "mocha",
dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.55, -- percentage of the shade to apply to the inactive window
    },
	}
vim.cmd.colorscheme "catppuccin"

require('aerial').setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
  end
})
require'colorizer'.setup()

EOF
