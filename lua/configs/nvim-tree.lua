require("nvim-tree").setup(
    {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true
        },
        -- 自动关闭
        -- auto_close = true,
        -- 视图
        auto_reload_on_write = true,
        view = {
            -- 宽度
            width = 30,
            -- 高度
            height = 30,
            -- 隐藏顶部的根目录显示
            hide_root_folder = false,
            -- 自动调整大小
            adaptive_size = true,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
        diagnostics = {
            -- 是否启用文件诊断信息
            enable = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = ""
            }
        },
        git = {
            -- 是否启用 git 信息
            enable = true,
            ignore = true,
            timeout = 500
        }
    }
)
-- 默认图标，可自行修改
vim.g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "",
        deleted = "",
        ignored = ""
    },
    folder = {
        arrow_open = "╰─▸",
        arrow_closed = "├─▸",
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}
-- 目录后加上反斜杠 /
vim.g.nvim_tree_add_trailing = 1