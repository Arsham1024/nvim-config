return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})
        local builtin = require('telescope.builtin')
        -- main keymaps
        vim.keymap.set('n', '<leader>t', function ()
            vim.cmd("Telescope")
        end, { desc = "opens the main telescope window"})

        -- file search
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})

        -- word search
        vim.keymap.set('n', '<leader>gs', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "global search for a word"})

        -- vim.keymap.set('n', '<leader>pWs', function()
        --     local word = vim.fn.expand("<cWORD>")
        --     builtin.grep_string({ search = word })
        -- end)

        vim.keymap.set('n', '<leader>grep', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        --buffers
        vim.keymap.set("n", "<leader>bu", builtin.buffers, { desc = "open the buffers list" })

        -- Jump to definition
        vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to definition with Telescope" })
         -- Find references
        vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Find references with Telescope" })
        -- go to implementation
        vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "Find implementations with Telescope" })

        print(builtin)
    end
}

