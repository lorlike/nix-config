{
  # ============================================================
  # 保存时自动格式化（配合 LSP 使用）
  # 参考: https://nix-community.github.io/nixvim/plugins/conform-nvim/index.html
  # ============================================================
  plugins.conform-nvim = {
    enable = true;
    # 自动安装 formatters_by_ft 中列出的格式化工具
    autoInstall.enable = true;
    settings = {
      formatters_by_ft = {
        rust = [ "rustfmt" ];
        lua = [ "stylua" ];
        python = [ "isort" "black" ];
        typescript = [ "prettierd" ];
        typescriptreact = [ "prettierd" ];
        javascript = [ "prettierd" ];
        javascriptreact = [ "prettierd" ];
        json = [ "prettierd" ];
        jsonc = [ "prettierd" ];
        css = [ "prettierd" ];
        html = [ "prettierd" ];
        markdown = [ "prettierd" ];
        yaml = [ "prettierd" ];
        nix = [ "nixfmt" ];
      };
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 3000;
      };
    };
  };
}
