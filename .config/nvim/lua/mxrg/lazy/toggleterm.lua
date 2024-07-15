
return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()

        local function set_terminal_size()
            local columns = vim.o.columns
            local lines = vim.o.lines
            if vim.o.columns > vim.o.lines then
                return math.floor(lines * 0.4)
            else
                return math.floor(columns * 0.4)
            end
        end

        require("toggleterm").setup{
            size = 50, --set_terminal_size,
            open_mapping = [[<C-t>]],
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = false,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            direction = 'vertical', -- options: 'horizontal', 'vertical', 'tab', 'float'
            close_on_exit = true,
            shell = vim.fn.executable('fish') == 1 and 'fish' or vim.o.shell,
            float_opts = {
                border = 'curved',
                winblend = 20,  -- Adjust this value to change transparency (0-100)
                highlights = {
                    border = "FloatBorder",
                    background = "NormalFloat",
                }
            }
        }
   end
}
