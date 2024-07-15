return {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local function on_attach(bufnr)
            local api = require('nvim-tree.api')
            local opts = { noremap = true, silent = true, buffer = bufnr }

            vim.keymap.set('n', '<CR>', api.node.open.edit, opts)
            vim.keymap.set('n', 'o', api.node.open.edit, opts)
            vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts)
            vim.keymap.set('n', 's', api.node.open.vertical, opts)
            vim.keymap.set('n', 'i', api.node.open.horizontal, opts)
            vim.keymap.set('n', 't', api.node.open.tab, opts)
            vim.keymap.set('n', 'R', api.tree.reload, opts)
            vim.keymap.set('n', 'a', api.fs.create, opts)
            vim.keymap.set('n', 'd', api.fs.remove, opts)
            vim.keymap.set('n', 'r', api.fs.rename, opts)
            vim.keymap.set('n', 'x', api.fs.cut, opts)
            vim.keymap.set('n', 'c', api.fs.copy.node, opts)
            vim.keymap.set('n', 'p', api.fs.paste, opts)
            vim.keymap.set('n', 'y', api.fs.copy.filename, opts)
            vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts)
            vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts)
            vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts)
            vim.keymap.set('n', ']c', api.node.navigate.git.next, opts)
            vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts)
            vim.keymap.set('n', 'q', api.tree.close, opts)
            vim.keymap.set('n', 'g?', api.tree.toggle_help, opts)
        end

        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = false,
            update_cwd = true,
            diagnostics = {
                enable = true,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
                update_root = false,
                ignore_list = {},
            },
            system_open = {
                cmd = nil,
                args = {},
            },
            filters = {
                dotfiles = false,
                custom = { ".git", "node_modules", ".cache" },
            },
            view = {
                width = 30,
                side = "left",
                number = false,
                relativenumber = false,
                signcolumn = "yes",
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
            actions = {
                open_file = {
                    resize_window = true,
                    quit_on_open = false,
                },
            },
            on_attach = on_attach,
        })

        -- Key mappings
        vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
    end,
}

