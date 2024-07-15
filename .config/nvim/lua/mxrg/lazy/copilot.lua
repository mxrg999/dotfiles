return {
    "zbirenbaum/copilot.lua",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "§",
                    next = "<M-å>",
                    prev = "<M-ä>",
                    dismiss = "<C-n>",
                },
            },
            filetypes = {
                rust = false,
                yaml = true,
                markdown = true,
                help = false,
                gitcommit = true,
                gitrebase = true,
                hgcommit = true,
                svn = true,
                cvs = true,
                ["."] = false,
            },
        })
    end,
}

