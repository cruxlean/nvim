local notify_opts = {
    -- 动画样式
    -- fade_in_slide_out
    -- fade
    -- slide
    -- static
    stages = "fade",
    -- 超时时间，默认 5s
    timeout = 12000
}
vim.notify = require("notify")
vim.notify.setup(notify_opts)
