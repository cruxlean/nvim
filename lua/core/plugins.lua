vim.cmd[[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(
    {
        function()
-- 所有插件的安装都书写在 function 中

            -- 包管理器
            use {
                "wbthomason/packer.nvim"
            }
            -- 中文文档
            use {
                "yianwillis/vimcdoc",
            }
            -- Neovim打开页
            -- use {"leslie255/aleph-nvim"}
            use {
                "goolord/alpha-nvim",
                config = function ()
                    require("configs.alpha-nvim")
                end
            }
            -- 启动时间优化
            use {"dstein64/vim-startuptime"}
            use {"lewis6991/impatient.nvim"}
            use {
                "nathom/filetype.nvim",
                config = function ()
                    require("configs.filetype")
                end
            }
            -- 缓冲区删除不改变布局
            use {
                "ojroques/nvim-bufdel",
                config = function ()
                    require("configs.nvim-bufdel")
                end
            }
            -- 查看符号大纲
            use {
                "simrat39/symbols-outline.nvim",
                config = function ()
                    require("configs.symbols-outline")
                end
            }
            -- 文件目录树
            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    -- 依赖一个图标插件
                    "kyazdani42/nvim-web-devicons"
                },
                config = function()
                    require("configs.nvim-tree")
                end
            }
            -- 自动保存
            use {
                "Pocco81/AutoSave.nvim",
                config = function ()
                    require("configs.AutoSave")
                end
            }
            -- 优秀的暗色主题
            use {
                "sainnhe/sonokai",
                config = function ()
                    require("configs.sonokai-theme")
                end
            }
            -- 炫酷的状态栏插件
            use {
                "nvim-lualine/lualine.nvim",
                requires = {
                    'kyazdani42/nvim-web-devicons', opt = true
                },
                config = function()
                    require("configs.lualine")
                end
            }
            -- 状态栏显示git信息
            use {
                "lewis6991/gitsigns.nvim",
                requires = {
                    -- 依赖于该插件（一款 Lua 开发使用的插件）
                    "nvim-lua/plenary.nvim"
                },
                config = function()
                    require("gitsigns").setup()
                end
            }
            -- 支持 LSP 状态的 buffer 栏
            use {
                "akinsho/bufferline.nvim",
                requires = {
                    "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
                },
                config = function()
                    require("configs.bufferline")
                end
            }
            -- 搜索时显示条目
            use {
                "kevinhwang91/nvim-hlslens",
                config = function ()
                    require("configs.nvim-hlslens")
                end
            }
            -- 显示缩进线
            use {
                "lukas-reineke/indent-blankline.nvim",
                config = function()
                    require("configs.indent-blankline")
                end
            }
            -- 自动匹配括号
            use {
                "windwp/nvim-autopairs",
                config = function()
                    require("configs.nvim-autopairs")
                end
            }
            -- 快速更改单词
            use {
                "AndrewRadev/switch.vim",
                config = function()
                    require("configs.switch")
                end
            }
            -- 快速跳转
            use {
                "phaazon/hop.nvim",
                branch = 'v2',
                config = function()
                    require("configs.hop")
                end
            }
            -- 包裹修改
            use {
                "ur4ltz/surround.nvim",
                requires = {
                    "tpope/vim-repeat"
                },
                config = function()
                    require("configs.surround")
                end
            }
            -- 显示光标下相同词汇
            use {
                "RRethy/vim-illuminate",
                config = function()
                    require("configs.vim-illuminate")
                end
            }
            -- 拼写检查器
            use {
                "lewis6991/spellsitter.nvim",
                config = function()
                    require("configs.spellsitter")
                end
            }
            -- 自动恢复光标位置
            use {
                "ethanholz/nvim-lastplace",
                config = function()
                    require("configs.nvim-lastplace")
                end
            }
            -- 全局替换
            use {
                "nvim-pack/nvim-spectre",
                requires = {
                    "nvim-lua/plenary.nvim", -- Lua 开发模块
                    "BurntSushi/ripgrep" -- 文字查找
                },
                config = function()
                    require("configs.nvim-spectre")
                end
            }
            -- 多光标模式
            use {
                "mg979/vim-visual-multi",
                config = function ()
                    require("configs.vimlens")
                end
            }
            vim.cmd([[
                aug VMlens
                    au!
                    au User visual_multi_start lua require('vmlens').start()
                    au User visual_multi_exit lua require('vmlens').exit()
                aug END
            ]])
            -- 显示滚动条
            use {
                "petertriho/nvim-scrollbar",
                config = function()
                    require("configs.nvim-scrollbar")
                end
            }
            -- 显示网页色
            use {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require("configs.nvim-colorizer")
                end
            }
            -- 内置终端
            use {
                "akinsho/toggleterm.nvim",
                tag = 'v1.*',
                config = function()
                    require("configs.toggleterm")
                end
            }
            -- 键位绑定器
            use {
                "folke/which-key.nvim",
                config = function()
                    require("configs.which-key")
                end
            }
            -- 模糊查找
            use {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/plenary.nvim", -- Lua 开发模块
                    "BurntSushi/ripgrep", -- 文字查找
                    "sharkdp/fd" -- 文件查找
                },
                config = function()
                    require("configs.telescope")
                end
            }
            use {"nvim-telescope/telescope-ui-select.nvim"}
            -- 精美弹窗
            use {
                "rcarriga/nvim-notify",
                config = function()
                    require("configs.nvim-notify")
                end
            }
            -- TODO注释样式
            use {
                "folke/todo-comments.nvim",
                config = function()
                    require("configs.todo-comments")
                end
            }
            -- LSP 基础服务
            use {"neovim/nvim-lspconfig"}
            -- LSP UI 美化
            use {
                "tami5/lspsaga.nvim",
                config = function()
                    require("configs.lspsaga")
                end
            }
            -- LSP 进度提示
            use {
                "j-hui/fidget.nvim",
                config = function()
                    require("configs.fidget")
                end
            }
            -- 插入模式获得函数签名
            use {
                "ray-x/lsp_signature.nvim",
                config = function()
                    require("configs.lsp_signature")
                end
            }
            -- 灯泡提示代码行为
            use {
                "kosayoda/nvim-lightbulb",
                config = function()
                    require("configs.nvim-lightbulb")
                end
            }
            use {
                "folke/trouble.nvim",
                requires = "kyazdani42/nvim-web-devicons",
                config = function()
                  require("configs.trouble-nvim")
                end
              }
            -- 自动代码补全系列插件
            use {
                "hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
                requires = {
                    {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标

                    -- For Luasnip users
                    -- {"L3MON4D3/LuaSnip"},
                    -- {"saadparwaiz1/cmp_luasnip"},

                    -- For vsnip users.
                    {"hrsh7th/vim-vsnip-integ"},
                    {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                    {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源

                    -- For ultisnips users.
                    -- {"SirVer/ultisnips"},
                    -- {"quangnguyen30192/cmp-nvim-ultisnips"}

                    -- For snippy users.
                    -- {"dcampos/nvim-snippy"},
                    -- {"dcampos/cmp-snippy"},
                    {"hrsh7th/cmp-nvim-lua"},
                    {"dmitmel/cmp-cmdline-history"},  --命令行历史记录
                    {"hrsh7th/cmp-nvim-lsp-document-symbol"}, --输入命令文档符号
                    {"hrsh7th/cmp-calc"},  --数学计算
                    {"hrsh7th/cmp-nvim-lsp-signature-help"}, --函数签名帮助
                    {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                    {"hrsh7th/cmp-path"}, -- 路径补全
                    {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                    {"hrsh7th/cmp-cmdline"}, -- 命令补全
                    {"f3fora/cmp-spell"}, -- 拼写建议
                    {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                    {"lukas-reineke/cmp-under-comparator"} -- 让补全结果的排序更加智能
                },
                config = function()
                    require("configs.nvim-cmp")
                end
            }
            use {
                "petertriho/cmp-git",
                requires = {
                    "nvim-lua/plenary.nvim"
                },
                config = function ()
                    require("configs.cmp-git")
                end
            }
            -- 扩展 LSP 诊断
            use {
                "mfussenegger/nvim-lint",
                config = function()
                    require("configs.nvim-lint")
                end
            }
            -- 语法高亮
            use {
                "nvim-treesitter/nvim-treesitter",
                run = {":TSUpdate"},
                requires = {
                    "p00f/nvim-ts-rainbow" -- 彩虹括号
                },
                config = function()
                    require("configs.nvim-treesitter")
                end
            }
            -- 显示当前可见缓冲区内容的上下文
            use {
                'nvim-treesitter/nvim-treesitter-context',
                config = function ()
                    require("configs.nvim-treesitter-context")
                end
            }
            -- 代码注释
            use {
                "numToStr/Comment.nvim",
                requires = {
                    "JoosepAlviste/nvim-ts-context-commentstring"
                },
                config = function()
                    require("configs.Comment")
                end
            }
            -- 代码格式化
            use {
                "sbdchd/neoformat",
                config = function()
                    require("configs.neoformat")
                end
            }
            -- 为不支持 LSP 高亮的主题提供默认高亮方案
            use {
                "folke/lsp-colors.nvim",
                config = function()
                    require("configs.lsp-colors")
                end
            }
            -- view tree
            use {
                "liuchengxu/vista.vim",
                config = function()
                    require("configs.vista")
                end
            }
            -- sqls
            use {"nanotee/sqls.nvim"}
            -- 代码调试基础插件
            use {
                "mfussenegger/nvim-dap",
                config = function()
                    require("configs.nvim-dap")
                end
            }                                             
            -- 为代码调试提供内联文本
            use {
                "theHamsta/nvim-dap-virtual-text",
                requires = {
                    "mfussenegger/nvim-dap"
                },
                config = function()
                    require("configs.nvim-dap-virtual-text")
                end
            }
            -- 为代码调试提供 UI 界面
            use {
                "rcarriga/nvim-dap-ui",
                requires = {
                    "mfussenegger/nvim-dap"
                },
                config = function()
                    require("configs.nvim-dap-ui")
                end
            }
            -- 会话管理
            --use {
            --    "Shatur/neovim-session-manager",
            --    requires = {
            --        "nvim-lua/plenary.nvim"
            --    },
            --    config = function ()
            --        require("configs.neovim-session-manager")
            --    end
            --}
        end,
            -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)