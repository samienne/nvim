return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        --"hrsh7th/cmp-nvim-lsp",
        'saghen/blink.cmp',
        { "antosha417/nvim-lsp-file-operations", config = true },
        "joechrisellis/lsp-format-modifications.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        --local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        lspconfig.util.default_config.on_attach = function(client, bufnr)
            vim.api.nvim_buf_create_user_command(
                bufnr,
                "FormatModifications",
                function()
                    local lsp_format_modifications = require("lsp-format-modifications")
                    lsp_format_modifications.format_modifications(client, bufnr)
                end,
                {}
            )
        end

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            lspconfig.util.default_config.on_attach(client, bufnr)

            opts.buffer = bufnr
            --local builtin = require('telescope.builtin')

            -- set keybinds
            opts.desc = "Toggle lsp signatures"
            vim.keymap.set({ 'n', "i" }, '<C-k>', vim.lsp.buf.signature_help, opts)

            opts.desc = "Show LSP references"
            --keymap.set("n", "gu", "<cmd>Telescope lsp_references path_display={'smart'}<CR>", opts)

            opts.desc = "Show LSP incoming"
            --keymap.set("n", "gu", "<cmd>Telescope lsp_incoming_calls path_display={'smart'}<CR>", opts)

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

            opts.desc = "Show LSP definitions"
            --keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

            opts.desc = "Show LSP implementations"
            --keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

            opts.desc = "Show LSP type definitions"
            --keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>fi", vim.lsp.buf.code_action, opts)

            opts.desc = "Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            opts.desc = "Show buffer diagnostics"
            --keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

            opts.desc = "Lsp diagnostics"
            --keymap.set('n', '<leader>dd', builtin.diagnostics, opts)

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

            opts.desc = "Format modified lines"
            keymap.set("n", "<leader>cf", "<cmd>FormatModifications<cr>", opts)

            opts.desc = "Format file"
            keymap.set("n", "<leader>cF", function()
                vim.lsp.buf.format({ async = true })
            end)

            opts.desc = "Format selection"
            keymap.set("v", "<leader>cf", function()
                vim.lsp.buf.format({ remap = false })
            end, opts)

            opts.desc = "Search workspace symbols"
            --keymap.set("n", "<leader>ss", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)

            opts.desc = "Search document symbols"
            --keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", opts)

            opts.desc = "Switch between source and header file (clangd)."
            keymap.set("n", "<leader>a", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
        end

        -- used to enable autocompletion (assign to every lsp server config)
        --local capabilities = cmp_nvim_lsp.default_capabilities()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        -- (not in youtube nvim video)
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- configure clangd server
        lspconfig["clangd"].setup({
            cmd = { "nice", "-n", "19", "clangd-21", "--background-index" },
            root_dir = lspconfig.util.root_pattern("compile_commands.json"),
            capabilities = capabilities,
            on_attach = on_attach,
        })
        --]]

        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim", "Snacks" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
