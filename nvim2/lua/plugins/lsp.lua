return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- PHP
            lspconfig.intelephense.setup({
                settings = {
                    intelephense = {
                        -- Set max memory usage for Intelephense (reduce if crashing persists)
                        maxMemory = 4096, -- Allocates 4GB RAM to Intelephense

                        -- Exclude unnecessary or large files from being indexed
                        files = {
                            exclude = {
                                "**/node_modules/**",
                                -- "**/vendor/**",
                                "**/.git/**",
                                "**/dist/**",
                                "**/storage/**",
                                "**/logs/**",
                                "**/cache/**",
                            },
                            maxSize = 5000000, -- Ignore files larger than 5MB
                        },

                        -- Disable features that consume a lot of memory (optional)
                        completion = {
                            fullyQualifiedGlobal = false, -- Disables FQCN suggestions
                        },
                    },
                },
            })

            -- Python
            lspconfig.pyright.setup({})

            lspconfig.tailwindcss.setup({})
            lspconfig.tsserver.setup({})
        end,
    },
}
