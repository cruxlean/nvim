local M = {}

function M.config()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
    local lsp_flags = {debounce_text_changes = 150,}
    local servers = { 'clangd', 'denols', 'pyright','cmake','vimls','sumneko_lua',
    'jsonls','yamlls','html','marksman','lemminx','powershell_es',"sqls","cssls"}
    for _, lsp in pairs(servers) do
        if lsp == "powershell_es" then
            require('lspconfig')[lsp].setup {
                bundle_path = 'd:/Users/darryl/EnvPath/LSPServer/PowerShellEditorServices',
                --on_attach = on_attach,
                capabilities = capabilities,
                flags = lsp_flags,
            }
        elseif lsp == "sqls" then
            require('lspconfig')[lsp].setup{
                cmd = {"d:/Users/darryl/EnvPath/LSPServer/SQLServer/sqls",
                "-config","d:/Users/darryl/EnvPath/LSPServer/SQLServer/config.yml"},
                capabilities = capabilities,
                flags = lsp_flags,
            }
        else
            require('lspconfig')[lsp].setup {
                --on_attach = on_attach,
                capabilities = capabilities,
                flags = lsp_flags,
            }
        end
    end

end

return M
