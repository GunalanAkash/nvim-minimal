return {
    "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false,
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = { "c", "lua", "vim" },

            auto_install = true,


            highlight = {
                enable = true,
            },
        }
        end
    }
