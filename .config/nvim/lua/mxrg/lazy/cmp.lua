return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "zbirenbaum/copilot-cmp",
    },
    config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-Space>"] = cmp.mapping.complete(), -- Open the completion menu
            ["<C-e>"] = cmp.mapping.close(),        -- Close the completion menu
            ["<CR>"] = cmp.mapping(function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback() -- Insert a newline
                end
            end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- Insert a literal Tab or perform indentation
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback() -- Insert a literal Shift+Tab
            end
        end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "copilot" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
            { name = "path" },
        }),
    })
    end
}

