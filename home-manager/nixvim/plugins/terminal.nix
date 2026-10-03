{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "horizontal";       # 底部打开
      start_in_insert = true;         # 打开后自动进入插入模式
      persist_mode = true;            # 保持终端会话
      close_on_exit = true;           # shell 退出后自动关闭窗口
    };
  };
  keymaps = [
    {
      mode = [ "n" "t" ];
      key = "<C-_>";
      action = "<cmd>ToggleTerm<cr>";
      options.desc = "Toggle terminal";
    }
  ];
}
