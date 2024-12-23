return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pylsp",
                "clangd",
                "jdtls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                zls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                ["pylsp"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pylsp.setup {
                        capabilities = capabilities,
                        settings = {
                            pylsp = {
                                plugins = {
                                    pycodestyle = {
                                        maxLineLength = 110
                                    }
                                }
                            }
                        }
                    }
                end,
                ["clangd"] = function()
                    require("lspconfig").clangd.setup {
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--background-index",
                            "--suggest-missing-includes",
                            "--clang-tidy",
                            "--header-insertion=iwyu",
                        },
                        settings = {
                            clangd = {
                                formatting = {
                                    tabSize = 2,
                                    insertSpaces = true,
                                },
                            },
                        },
                    }
                end,
                ["jdtls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.jdtls.setup({
                        capabilities = capabilities,
                        cmd = { "jdtls" }, -- Ensure jdtls is in your PATH or specify the full path
                        root_dir = require("lspconfig.util").root_pattern(".git", "pom.xml", "build.gradle"),
                        settings = {
                            java = {
                                format = {
                                    enabled = true,
                                    settings = {
                                        -- url = vim.fn.stdpath("config") .. "/java/eclipse-formatter.xml", -- Optional, use your formatter
                                        profile = "GoogleStyle"
                                    }
                                },
                                saveActions = {
                                    organizeImports = true,
                                },
                            },
                        },
                        init_options = {
                            bundles = {},
                        },
                    })
                end,
            }
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
