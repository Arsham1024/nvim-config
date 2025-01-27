vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- moves the highlighted line up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- allows to hold the paste in buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "y", [["+y]])
vim.keymap.set("n", "Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

-- terminal
-- open
-- Store the terminal buffer ID
local term_buf = nil

-- Open or bring back the terminal
vim.keymap.set("n", "<C-`>", function()
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        -- Terminal exists, bring it back
        vim.cmd.vnew() -- Open a vertical split
        vim.cmd("b " .. term_buf)
        vim.cmd("wincmd J") -- Move it to the bottom
        vim.api.nvim_win_set_height(0, 15) -- Adjust terminal height
    else
        -- Terminal doesn't exist, create a new one
        vim.cmd.vnew() -- Open a vertical split
        vim.cmd.term() -- Start a terminal
        vim.cmd.wincmd("J") -- Move it to the bottom
        vim.api.nvim_win_set_height(0, 15) -- Set terminal height
        term_buf = vim.api.nvim_get_current_buf() -- Save the terminal buffer ID
    end
end, { desc = "Toggle terminal" })

-- Minimize the terminal
vim.keymap.set("t", "<C-q>", function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
    vim.cmd("hide") -- Hide the terminal window
end, { desc = "Minimize the terminal" })

