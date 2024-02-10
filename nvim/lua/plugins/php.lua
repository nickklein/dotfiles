return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").intelephense.setup({})
        end,
    },
    -- Add more PHP-related plugins or configurations here as needed
    {
        "jwalton512/vim-blade",
        ft = "blade",
    },
}
