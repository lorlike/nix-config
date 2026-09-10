{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nv = "nvim";
      ra = "y";
    };

    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }

#      {
#        name = "zsh-fast-syntax-highlighting";
#        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh-fast-syntax-highlighting";
#      }
    ];

    initContent = ''
      WIN_HOST="$(ip route | awk '/default/ {print $3; exit}')"

      if [ -n "$WIN_HOST" ]; then
        export http_proxy="http://$WIN_HOST:7897"
        export https_proxy="http://$WIN_HOST:7897"
        export all_proxy="http://$WIN_HOST:7897"

        export HTTP_PROXY="$http_proxy"
        export HTTPS_PROXY="$https_proxy"
        export ALL_PROXY="$all_proxy"
      fi

      # 加载 agenix 解密的隐私环境变量（如 API key）
      # 解密路径为 $XDG_RUNTIME_DIR/agenix/env（home-manager 激活时由用户身份解密）
      if [ -n "$XDG_RUNTIME_DIR" ] && [ -r "$XDG_RUNTIME_DIR/agenix/env" ]; then
        source "$XDG_RUNTIME_DIR/agenix/env"
      fi
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship.enable=true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;

  };

}
