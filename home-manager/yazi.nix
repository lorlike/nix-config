{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;

    plugins = {
      "lazygit" = pkgs.yaziPlugins.lazygit;
      "bookmarks" = pkgs.yaziPlugins.bookmarks;
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "g" "i" ];
          run = "plugin lazygit";
          desc = "Run lazygit";
        }
        {
          on = [ "M" ];
          run = "plugin bookmarks save";
          desc = "Save current position as a bookmark";
        }
        {
          on = [ "`" ];
          run = "plugin bookmarks jump";
          desc = "Jump to a bookmark";
        }
        {
          on = [ "b" "d" ];
          run = "plugin bookmarks delete";
          desc = "Delete a bookmark";
        }
        {
          on = [ "b" "D" ];
          run = "plugin bookmarks delete_all";
          desc = "Delete all bookmarks";
        }
      ];
    };
  };
}
