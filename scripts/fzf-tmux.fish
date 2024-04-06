#!/usr/bin/fish

# Start building the find command with a depth limit
# Change to -type d to select directories
set find_command "find ~/code ~/.config -maxdepth 1 -type d"

# Define your array of directories to exclude
# For example: set exclude_dirs dir1 dir2 dir3
set exclude_dirs dir1 dir2 dir3

# Loop through the array and append each exclusion to the find command
for dir in $exclude_dirs
    set find_command $find_command" ! -path '*/"$dir"/*'"
end

# Execute the find command and pipe it to fzf
set selected_dir (eval $find_command | fzf)

# Check if a directory was selected

if test -n "$selected_dir"
    # Extract the directory name to use as the session name
    set session_name (basename "$selected_dir")

    # Check if we are currently inside a tmux session
    if set -q TMUX
        # Check if the tmux session already exists
        if tmux has-session -t $session_name 2>/dev/null
            tmux switch-client -t $session_name
        else
            # Start a new tmux session in the background in the selected directory
            tmux new-session -d -s $session_name -c $selected_dir
            # Switch to the newly created session
            tmux switch-client -t $session_name
        end
    else
        # If not in a tmux session, either attach to the existing session or create a new one and attach
        if tmux has-session -t $session_name 2>/dev/null
            echo "Session $session_name already exists. Attaching..."
        else
            # Start a new tmux session in the selected directory
            tmux new-session -d -s $session_name -c $selected_dir
        end

        # Attach to the session (existing or newly created)
        tmux attach-session -t $session_name
    end
else

end
