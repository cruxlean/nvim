-- local luasnip = require 'luasnip'
local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup(
    ---@diagnostic disable-next-line: redundant-parameter
    {
        -- 指定补全引擎
        snippet = {
            expand = function(args)
                -- 使用 vsnip 引擎
                vim.fn["vsnip#anonymous"](args.body)
                -- luasnip
                -- require('luasnip').lsp_expand(args.body)
                -- snippy
                -- require('snippy').expand_snippet(args.body)
                -- ultisnip
                -- vim.fn["UltiSnips#Anon"](args.body)
            end
        },
        -- 指定补全源（安装了补全源插件就在这里指定）
        sources = cmp.config.sources(
            {
                {name = "vsnip"},
                {name = "nvim_lsp"},
                {name = "path"},
                {name = "buffer"},
                {name = "cmdline"},
                {name = "spell"},
                {name = "git"},
                {name = "nvim_lsp_signature_help"},
                {name = "calc"},
                {name = "nvim_lua"}
            },
            {
                {name = "buffer"}
            }
        ),
        -- 格式化补全菜单
        formatting = {
            format = lspkind.cmp_format(
                {
                    --mode = 'symbol',
                    with_text = true,
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                        return vim_item
                    end
                }
            )
        },
        -- 对补全建议排序
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                require("cmp-under-comparator").under,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order
            }
        },
        -- 绑定补全相关的按键
        mapping = cmp.mapping.preset.insert({
        --mapping = {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            -- Accept currently selected item...
            -- Set `select` to `false` to only confirm explicitly selected items:
            --['<CR>'] = cmp.mapping.confirm({ select = true }),
            -- 上一个
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            -- 下一个
            ["<C-n>"] = cmp.mapping.select_next_item(),
            -- 选择补全
            ["<CR>"] = cmp.mapping.confirm{
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            },
            --  出现或关闭补全
            ["<C-k>"] = cmp.mapping(
                {
                    i = function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end,
                    c = function()
                        if cmp.visible() then
                            cmp.close()
                        else
                            cmp.complete()
                        end
                    end
                }
            ),
            -- 类似于 IDEA 的功能，如果没进入选择框，
            --tab会选择下一个，如果进入了选择框，tab 会确认当前选择
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    local entry = cmp.get_selected_entry()
                    if not entry then
                        cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                    end
                    cmp.confirm()
                else
                    fallback()
                end
            end,{"i", "s","c"}),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end, { "i", "s" ,"c"})
        })
    }
)
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
})
-- 命令行 / 模式提示
cmp.setup.cmdline({"/","?"},{
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        {
            { name = 'nvim_lsp_document_symbol' }
        },
        {
            { name = 'buffer' }
        }
    }
})
-- 命令行 : 模式提示
cmp.setup.cmdline(":",{
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        },
        {
            { name = 'cmdline_history' }
        })
    }
)
