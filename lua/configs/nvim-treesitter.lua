require("nvim-treesitter.configs").setup(
    {
        -- 安装的高亮支持来源
        -- ensure_installed = "maintained",
        -- 同步下载高亮支持
        sync_install = true,
        ensure_installed = { "c","cpp","lua","html","yaml","python",
        "vim","java","bash","json","toml","markdown","make","css","javascript","typescript"},
        ignore_install = { }, -- parsers to not install
        auto_install = true,
        -- 高亮相关
        highlight = {
            -- 启用高亮支持
            enable = true,
            -- 使用 treesitter 高亮而不是 neovim 内置的高亮
            additional_vim_regex_highlighting = false
        },
        -- 范围选择
        incremental_selection = {
            enable = true,
            keymaps = {
                -- 初始化选择
                init_selection = "<CR>",
                -- 递增
                node_incremental = "<CR>",
                -- 递减
                node_decremental = "<BS>",
                -- 选择一个范围
                scope_incremental = "<TAB>"
            }
        },
        -- 缩进，关闭
        indent = {
            enable = false
        },
        -- 彩虹括号，由 nvim-ts-rainbow 插件提供
        rainbow = {
            enable = true,
            extended_mode = true
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        -- 根据当前上下文定义文件类型，由 nvim-ts-context-commentstring 插件提供
        context_commentstring = {
            enable = true
        }
    }
)
