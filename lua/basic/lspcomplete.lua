local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_flags = {debounce_text_changes = 150,}

local servers = { 'clangd', 'denols', 'pyright','cmake','vimls','sumneko_lua',
'jsonls','yamlls','html',"cssls"}

for _, lsp in pairs(servers) do
        lspconfig[lsp].setup {
            --on_attach = on_attach,
            capabilities = capabilities,
            flags = lsp_flags,
        }
end
