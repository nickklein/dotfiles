return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- PHP
            lspconfig.intelephense.setup({})

            -- Python
            lspconfig.pyright.setup({})

            lspconfig.tailwindcss.setup({})
            lspconfig.tsserver.setup({})
        end,
    },
}
