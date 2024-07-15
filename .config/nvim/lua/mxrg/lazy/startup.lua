return {
    "startup-nvim/startup.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
        -- Define and set highlight groups for each logo line
        vim.api.nvim_set_hl(0, "StartupLogo1", { fg = "#311B92" }) -- Indigo
        vim.api.nvim_set_hl(0, "StartupLogo2", { fg = "#512DA8" }) -- Deep Purple
        vim.api.nvim_set_hl(0, "StartupLogo3", { fg = "#673AB7" }) -- Deep Purple
        vim.api.nvim_set_hl(0, "StartupLogo4", { fg = "#9575CD" }) -- Medium Purple
        vim.api.nvim_set_hl(0, "StartupLogo5", { fg = "#B39DDB" }) -- Light Purple
        vim.api.nvim_set_hl(0, "StartupLogo6", { fg = "#D1C4E9" }) -- Very Light Purple

        require("startup").setup({
            theme = "dashboard",
            options = {
                mapping_keys = true,
                cursor_column = 0.5,
                empty_lines_between_mappings = true,
                disable_statuslines = true,
                paddings = {1,2},
            },
            parts = {
                {
                    type = "text",
                    oldfiles_directory = false,
                    align = "center",
                    fold_section = false,
                    title = "Header",
                    margin = 5,
                    content = {
                        { "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ", hl = "StartupLogo1" },
                        { "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ", hl = "StartupLogo2" },
                        { "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ", hl = "StartupLogo3" },
                        { "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ", hl = "StartupLogo4" },
                        { "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ", hl = "StartupLogo5" },
                        { "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ", hl = "StartupLogo6" },
                    },
                    highlight = "Statement",
                    default_color = "",
                    oldfiles_amount = 0,
                },
                {
                    type = "mapping",
                    oldfiles_directory = false,
                    align = "center",
                    fold_section = false,
                    title = "Basic Commands",
                    margin = 5,
                    content = {
                        { " Find File", "Telescope find_files", "<leader>ff" },
                        { " Find Word", "Telescope live_grep", "<leader>fg" },
                        { " Recent Files", "Telescope oldfiles", "<leader>fo" },
                        { " File Browser", "Telescope file_browser", "<leader>fb" },
                        { " Colorschemes", "Telescope colorscheme", "<leader>fc" },
                        { " New File", "lua require'startup'.new_file()", "<leader>nf" },
                    },
                    highlight = "String",
                    default_color = "",
                    oldfiles_amount = 0,
                },
                {
                    type = "oldfiles",
                    oldfiles_directory = false,
                    align = "center",
                    fold_section = false,
                    title = "Recent Files",
                    margin = 5,
                    content = {},
                    highlight = "String",
                    default_color = "",
                    oldfiles_amount = 5,
                },
            },
        })
    end
}

