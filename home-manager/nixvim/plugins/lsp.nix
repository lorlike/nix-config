{
  # ============================================================
  # LSP 配置
  # 参考: https://nix-community.github.io/nixvim/lsp/servers/index.html
  # ============================================================
  plugins.lspconfig.enable = true;
  lsp = {
    # 全局 inlay hints（各服务器可再通过自身 settings 细分）
    inlayHints.enable = true;
    # 代码透镜（如 rust-analyzer 的 run/test 按钮）
    # codelens.enable = true;

    # 所有语言服务器共用的配置
    servers."*".config = {
      capabilities.textDocument.semanticTokens = {
        multilineTokenSupport = true;
      };
    };

    # ---- 各语言服务器 ----
    servers = {
      # Rust: rust-analyzer
      rust_analyzer = {
        enable = true;
        config.settings."rust-analyzer" = {
          procMacro.enable = true;
          inlayHints = {
            bindingModeHints.enable = true;
            chainingHints.enable = true;
            closingBraceHints.enable = true;
            lifetimeElisionHints.enable = "skip_trivial";
            parameterHints.enable = true;
            typeHints.enable = true;
          };
          # 如已安装 clippy，可改用 clippy 检查：
          # check.command = "clippy";
        };
      };

      # Lua: lua-language-server
      lua_ls = {
        enable = true;
        config.settings.Lua = {
          runtime.version = "LuaJIT";
          diagnostics.globals = [ "vim" ];
          telemetry.enable = false;
          workspace = {
            checkThirdParty = false;
            # 将 Neovim 自身运行时目录加入 workspace library，
            # 让 lua-language-server 认识 vim.* 全局变量，避免误报未定义
            library = {
              __raw = "vim.api.nvim_get_runtime_file('', true)";
            };
          };
        };
      };

      # Python: pyright
      pyright = {
        enable = true;
        config.settings.python.analysis = {
          typeCheckingMode = "basic";
          diagnosticMode = "openFilesOnly";
          autoSearchPaths = true;
          useLibraryCodeForTypes = true;
        };
      };

      # TypeScript / JavaScript: typescript-language-server
      ts_ls = {
        enable = true;
        config.settings = {
          typescript.inlayHints = {
            parameterNames.enabled = "all";
            parameterTypes.enabled = true;
            variableTypes.enabled = true;
            propertyDeclarationTypes.enabled = true;
            functionLikeReturnTypes.enabled = true;
            enumMemberValues.enabled = true;
          };
          javascript.inlayHints = {
            parameterNames.enabled = "all";
            parameterTypes.enabled = true;
            variableTypes.enabled = true;
            propertyDeclarationTypes.enabled = true;
            functionLikeReturnTypes.enabled = true;
            enumMemberValues.enabled = true;
          };
        };
      };
    };

    # LSP 键位（仅在语言服务器 attach 到 buffer 时生效）
    keymaps = [
      # --- 导航 ---
      {
        key = "gd";
        lspBufAction = "definition";
        options.desc = "Goto Definition";
      }
      {
        key = "gD";
        lspBufAction = "declaration";
        options.desc = "Goto Declaration";
      }
      {
        key = "gt";
        lspBufAction = "type_definition";
        options.desc = "Type Definition";
      }
      {
        key = "gi";
        lspBufAction = "implementation";
        options.desc = "Goto Implementation";
      }
      {
        key = "gr";
        lspBufAction = "references";
        options.desc = "List References";
      }

      # --- 文档 / 提示 ---
      {
        key = "K";
        lspBufAction = "hover";
        options.desc = "LSP Hover";
      }
      # {
      #   key = "gs";
      #   lspBufAction = "signature_help";
      #   options.desc = "LSP: 签名帮助";
      # }
      {
        mode = ["n" "x"];
        key = "<leader>ca";
        lspBufAction = "code_action";
        options.desc = "LSP: 代码操作";
      }
      {
        key = "<leader>cr";
        lspBufAction = "rename";
        options.desc = "Rename Symbol";
      }
      # {
      #   key = "<leader>cf";
      #   lspBufAction = "format";
      #   options.desc = "LSP: 格式化";
      # }

      # # --- 诊断 ---
      # {
      #   key = "<leader>dk";
      #   action.__raw = "function() vim.diagnostic.jump({ count = -1, float = true }) end";
      #   options.desc = "LSP: 上一个诊断";
      # }
      # {
      #   key = "<leader>dj";
      #   action.__raw = "function() vim.diagnostic.jump({ count = 1, float = true }) end";
      #   options.desc = "LSP: 下一个诊断";
      # }
      # {
      #   key = "<leader>dx";
      #   action.__raw = "function() vim.diagnostic.open_float() end";
      #   options.desc = "LSP: 打开诊断浮窗";
      # }

      # # --- LSP 进程管理 ---
      # {
      #   key = "<leader>lr";
      #   action = "<CMD>LspRestart<CR>";
      #   options.desc = "LSP: 重启服务器";
      # }
      # {
      #   key = "<leader>ls";
      #   action = "<CMD>LspStart<CR>";
      #   options.desc = "LSP: 启动服务器";
      # }
      # {
      #   key = "<leader>lq";
      #   action = "<CMD>LspStop<CR>";
      #   options.desc = "LSP: 停止服务器";
      # }
    ];
  };


}
