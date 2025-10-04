return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "tailwindcss",
            },
        })


        vim.diagnostic.config {
            virtual_text = true,
            signs = true,
            severity_sort = true,
        }

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
                vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
                vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
                vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition)
                vim.keymap.set("n", "<leader>gs", vim.lsp.buf.document_symbol)
                vim.keymap.set("n", "<leader>gh", vim.lsp.buf.signature_help)

            end,
        })

    end

}
