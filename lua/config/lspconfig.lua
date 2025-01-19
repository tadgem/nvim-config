local on_attach = require("configs.lspconfig").on_attach
local on_init = require("configs.lspconfig").on_init
local capabilities = require("configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
lspconfig.servers = {
    "lua_ls",
    "clangd",
    -- "gopls",
    -- "hls",
    -- "ols",
    -- "pyright",
}

-- list of servers configured with default config.
local default_servers = {
    -- "ols",
    -- "pyright",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    })
end

lspconfig.clangd.setup({
        on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    
    on_init = on_init,
    capabilities = capabilities,
})