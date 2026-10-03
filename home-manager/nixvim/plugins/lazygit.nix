{
  plugins.lazygit.enable = true;

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>gi";
      action = "<cmd>LazyGit<cr>";
      options.desc = "open LazyGit";
    }
  ];
}
