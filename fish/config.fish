set tmux_sessionizer '/home/isaiah/.config/scripts/tmux-sessionizer.fish'


if status is-interactive
  alias src 'source ~/.config/fish/config.fish && tmux source-file ~/.config/tmux/tmux.conf'

  alias gcf 'git add nvim tmux alacritty i3 fish scripts'

  alias gs 'git status'

  bind \ef 'tmux_find'

  bind \e- 'nvim .'

  bind \eb 'tmux_start' 


end


function tmux_find
    if not set -q TMUX
        fish $tmux_sessionizer
    else
        tmux neww '~/.config/scripts/tmux-sessionizer.fish'
    end
end


function tmux_start
    if not set -q TMUX
      if tmux list-sessions > /dev/null 2>&1
          tmux a
      else
        fish $tmux_sessionizer
      end
    end
end




