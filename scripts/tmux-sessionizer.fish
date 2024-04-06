#! /usr/bin/fish

function tmux_connect_or_create --argument session_name session_dir
    # Check if the session exists
    if tmux has-session -t $session_name 2>/dev/null
        tmux attach-session -t $session_name
    else
        tmux new-session -s $session_name -c $session_dir
    end
end

# Check if exactly one argument is given
if test (count $argv) -eq 1
    set selected $argv[1]
else
    # Use `find` and `fzf` to select a directory
    set selected (find ~/study ~/notes ~/code ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
end

# Exit if no selection was made
if test -z "$selected"
    exit 0
end

# Replace periods in directory name with underscores for the session name
set selected_name (basename "$selected" | tr . _)

# Replace periods in directory name with underscores for the session name

# Check if tmux is running
set tmux_running (pgrep tmux)

# Replace periods in directory name with underscores for the session name

# Start a new tmux session if tmux isn't already running and we're not in a tmux session

if test -z "$TMUX";
    tmux_connect_or_create $selected_name $selected
    exit 0
end

# Create a new detached session if one doesn't exist with the given name
if not tmux has-session -t=$selected_name 2>/dev/null
    tmux new-session -ds $selected_name -c $selected
end

# Switch to the named session
tmux switch-client -t $selected_name

