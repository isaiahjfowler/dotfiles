if status is-interactive
  alias src 'source ~/.config/fish/config.fish && tmux source-file ~/.config/tmux/tmux.conf'

  alias gs 'git status'

  bind \ef 'source ~/.config/scripts/tmux-sessionizer.fish'

  bind \e- 'nvim .'

  bind \eb 'tmux_start' 
end

function tmux_start
    if not set -q TMUX
      if tmux list-sessions > /dev/null 2>&1
          tmux a
      else
         tmux new-session -s ~/notes -c ~/notes
      end
    end
end




