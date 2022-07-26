local Toggleterm = require("toggleterm")
Toggleterm.setup(
    {
        --  开启的终端默认进入插入模式
        start_in_insert = true,
        -- 设置终端打开的大小
        size = 6,
        -- 打开普通终端时，关闭拼写检查
        on_open = function()
            vim.cmd("setlocal nospell")
        end
    }
)
-- 新建终端
local Terminal = require("toggleterm.terminal").Terminal
-- 新建浮动终端
local floatTerm = Terminal:new({
    hidden = true,
    direction = "float",
    float_opts = {
        border = "double"
    },
    on_open=function (term)
    end,
    on_close = function ()
    end
})
-- 新建 lazygit 终端
local lazyGit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "double",
    },
    on_open=function (term)
    end,
    on_close = function ()
    end
})

-- 定义新的方法
Toggleterm.float_toggle = function()
    floatTerm:toggle()
end
Toggleterm.lazygit_toggle = function()
    lazyGit:toggle()
end