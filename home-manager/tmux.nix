{
  programs.tmux = {
    enable = true;
    extraConfig = ''
# ~/.dotfiles/tmux/.tmux.conf（~/.tmux.conf 是指向本文件的软链）
# 快捷键方案：对齐 herdr（prefix=ctrl+b + alt 直接键）
# herdr 键位参考: ~/.dotfiles/herdr/.config/herdr/config.toml
# 重载: prefix+R 或 tmux source-file ~/.tmux.conf
# 查看全部键位: prefix+? 或 tmux list-keys

# ---------- 基础 ----------
set -g mouse on
set -g base-index 1          # 窗口编号从 1 开始（对应 herdr 的 tab 编号）
setw -g pane-base-index 1    # pane 编号从 1 开始
set -g escape-time 10        # ESC 响应更快（tmux 默认 500ms，vim/pi 会觉得卡）
set -g focus-events on       # 向内层程序转发焦点事件（nvim autoread 等需要）
set -g history-limit 100000  # 滚动缓冲 ≈ herdr 的 10MB（默认 2000 行太少，嫌占内存可调低）

# 新窗口/分屏跟随当前目录
bind c   new-window   -c "#{pane_current_path}"
bind '"' split-window -v -c "#{pane_current_path}"
bind %   split-window -h -c "#{pane_current_path}"

# 扩展键透传给终端内程序（你原有的配置，保留）
set -g extended-keys on
set -g extended-keys-format csi-u

# ---------- 直接键（-n = 无需 prefix），对应 herdr 的 alt 系 ----------
# tmux 默认根表没有任何键盘绑定，以下全部无冲突。
# 注意：这些键按下后不再到达终端内的程序（herdr 同理）。

# herdr: switch_tab   = alt+1..9  → 切换窗口
bind -n M-1 select-window -t :=1
bind -n M-2 select-window -t :=2
bind -n M-3 select-window -t :=3
bind -n M-4 select-window -t :=4
bind -n M-5 select-window -t :=5
bind -n M-6 select-window -t :=6
bind -n M-7 select-window -t :=7
bind -n M-8 select-window -t :=8
bind -n M-9 select-window -t :=9

# herdr: close_pane   = alt+q     → 关闭 pane
bind -n M-q kill-pane

# herdr: zoom         = alt+f     → pane 全屏/还原
bind -n M-f resize-pane -Z

# herdr: detach       = alt+shift+q
bind -n M-Q detach-client

# herdr: split_vertical = alt+enter   → 左右分屏
bind -n M-Enter split-window -h -c "#{pane_current_path}"

# herdr: new_tab      = alt+shift+enter → 新建窗口
# 仅当外层终端发送 CSI-u 编码时才能与 alt+enter 区分（见文末 alacritty 说明）；
# legacy 编码下按下 alt+shift+enter 会触发上面的 M-Enter（分屏）。
bind -n M-S-Enter new-window -c "#{pane_current_path}"

# herdr: split_horizontal = alt+minus  → 上下分屏
bind -n M-- split-window -v -c "#{pane_current_path}"

# herdr: focus_pane_* = alt+方向键  → 移动焦点
bind -n M-Left  select-pane -L
bind -n M-Down  select-pane -D
bind -n M-Up    select-pane -U
bind -n M-Right select-pane -R

# herdr: alt+tab（侧边栏）/ alt+shift+tab（下一个 agent）→ tmux 无对应概念，未绑定

# ---------- prefix 层（ctrl+b，与 herdr 的 prefix 键对齐）----------
# herdr: split_vertical   = prefix+v（tmux 默认 v 是上下分，方向与 herdr 相反，这里改掉）
bind v split-window -h -c "#{pane_current_path}"
# herdr: split_horizontal = prefix+minus（覆盖 tmux 默认的 delete-buffer，
#                          删 buffer 仍可用 prefix+= 进入 choose-buffer）
bind - split-window -v -c "#{pane_current_path}"

# herdr: focus_pane_left/down/up/right = prefix+h/j/k/l
# 覆盖 tmux 默认的 prefix+l(last-window)，last-window 改到了 prefix+L
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind L last-window

# herdr: edit_scrollback = prefix+e → 滚动/复制模式
bind e copy-mode

# herdr: close_tab       = prefix+shift+x（tmux 默认是 prefix+&）
bind X confirm-before -p "kill-window #W? (y/n)" kill-window

# herdr: reload_config   = prefix+shift+r
bind R source-file ~/.tmux.conf \; display-message "tmux.conf 已重载"

# 以下键 tmux 默认值与 herdr 语义一致，无需配置：
#   prefix+c 新建窗口 | prefix+x 关 pane(带确认) | prefix+z 全屏 pane
#   prefix+p / prefix+n 上/下一个窗口 | prefix+1..9 切换窗口
#   prefix+w 会话/窗口树（≈ herdr workspace picker）| prefix+? 帮助
#   prefix+方向键 移动焦点 | prefix+M-方向键 / prefix+C-方向键 调整大小(可连按)
# 保留了 tmux 默认但 herdr 没有的：prefix+q display-panes（detach 在 prefix+d）

# ---------- 附：让 alt+shift+enter 在 alacritty 中生效（可选）----------
# alacritty 默认把 alt+shift+enter 和 alt+enter 发同样的字节，tmux 无法区分。
# 在 ~/.dotfiles/alacritty/.config/alacritty/alacritty.toml 中加入：
#   [[keyboard.bindings]]
#   key = "Enter"
#   mods = "Shift|Alt"
#   chars = "\u001b[13;4u"
# 加入后 alt+shift+enter 即可在 tmux 中新建窗口（CSI-u 编码，tmux 已验证可解析）。
    '';
  };
}
