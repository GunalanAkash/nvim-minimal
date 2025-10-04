return {
    "hrsh7th/cmp-nvim-lsp",

    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        "roobert/tailwindcss-colorizer-cmp.nvim",
    },

    config = function()
        local tailwindcolors = require("tailwindcss-colorizer-cmp")

        tailwindcolors.setup({
            color_square_width = 2,
        })

        local cmp = require("cmp")
        local lspkind = require("lspkind")


        cmp.setup({
            mapping = {
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            sources = cmp.config.sources({
                { name = "lazydev" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "luasnip" },
                { name = "buffer" },
            }),

            buffer = {
                sources = {
                    { name = "vim-dabod-autocompletion" },
                }
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },

            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    menu = {
                        buffer = "[buf]",
                        nvim_lsp = "[LSP]",
                        path = "[path]",
                        luasnip = "[snip]",
                    }
                })
            },

            experimental = {
                ghost_text = true
            }
        })
    end
}
