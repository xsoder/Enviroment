return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
                filetypes = { "html", "htmldjango", "htmx", "templ", "blade" }, -- Added htmx support
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            -- Added Rust LSP (rust-analyzer)
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            -- Added Python LSP (pyright)
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            -- Added C/C++ LSP (clangd)
            lspconfig.clangd.setup({
                capabilities = capabilities,
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>fq", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>dq", ":copen<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>dq", ":cclose<CR>", { noremap = true, silent = true })
        end,
    },
}
