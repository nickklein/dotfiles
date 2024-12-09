#!/bin/bash

# Start a new tmux session named 'chatapp'
SESSION="intiveo"
tmux has-session -t $SESSION 2>/dev/null
if [ $? == 0 ]; then
    echo "In session"
    exit 1
fi

tmux new-session -d -s $SESSION

tmux send-keys -t $SESSION:1 "cd /home/nickklein/projects/intiveo" C-m
# Select the top pane
tmux send-keys "nvim ." C-m

# Make the bottom pane smaller by moving the divider up by lines
tmux resize-pane -D 30

# Create 'admin-process' window and set up panes
tmux new-window -t $SESSION -n "bash"
tmux send-keys "cd /home/nickklein/projects/intiveo/admin" C-m

tmux new-window -t $SESSION -n "mycli"
tmux send-keys -t $SESSION:mycli "mycli" C-m

tmux attach-session -t $SESSION
