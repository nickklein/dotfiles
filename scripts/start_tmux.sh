#!/bin/bash
source ~/.bashrc

# Start a new tmux session named 'backup'
SESSION="backup"
tmux new-session -d -s $SESSION

# Stop all running Docker containers
tmux send-keys -t $SESSION:1 "/bin/bash /home/tyrion/Duplicity/backup.sh" C-m

# Attach to the tmux session
tmux attach-session -t $SESSION
