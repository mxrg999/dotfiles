vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Exit insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jk", "<esc>")

-- Moving around in a file
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- LSP keybindings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })

-- Go back one step in jumplist
vim.keymap.set("n", "<C-o>", "<C-o>")

-- paste over, save what was pasted
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", "+y")
vim.keymap.set("n", "<leader>y", "+y")

-- Quick save and Exit
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>")
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>")

-- Open command line in nvim
vim.keymap.set("n", "<leader>!", ":! ")
vim.keymap.set("n", "<leader>!!", ":! cargo run<CR>")

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Block Q
vim.keymap.set("n", "Q", "<nop>")

-- Format fuffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")

-- Clear after search
vim.keymap.set("n", "<leader>ur", "<cmd>nohl<cr>")

-- Add a clear line
vim.keymap.set("n", "<leader>o", "o<Esc>k")
vim.keymap.set("n", "<leader>O", "O<Esc>j")

-- Replace the current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file into a bash executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ne",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)


local copilot_on = true
vim.api.nvim_create_user_command("CopilotToggle", function()
	if copilot_on then
		vim.cmd("Copilot disable")
		print("Copilot OFF")
	else
		vim.cmd("Copilot enable")
		print("Copilot ON")
	end
	copilot_on = not copilot_on
end, { nargs = 0 })
vim.keymap.set("", "<M-p>", ":CopilotToggle<CR>", { noremap = true, silent = true })



-- Toggle wrap
function ToggleWrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.notify("Wrap disabled", vim.log.levels.INFO)
  else
    vim.wo.wrap = true
    vim.notify("Wrap enabled", vim.log.levels.INFO)
  end
end

-- Alt + z to toggle wrap
vim.api.nvim_set_keymap('n', '<A-z>', ':lua ToggleWrap()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-z>', '<C-o>:lua ToggleWrap()<CR>', { noremap = true, silent = true })


