#!/bin/bash

# Start a new tmux session named 'chatapp'
SESSION="intiveo"
tmux new-session -d -s $SESSION

tmux send-keys -t $SESSION:1 "cd /home/nickklein/projects/intiveo" C-m
tmux send-keys "nvim ." C-m

tmux new-window -t $SESSION -n "cli"
tmux send-keys "cd ~/projects/intiveo/intiveo-docker/ && docker compose down && docker compose up -d" C-m
tmux send-keys "cd /home/nickklein/projects/intiveo/" C-m

tmux new-window -t $SESSION -n "mycli"
tmux send-keys -t $SESSION:mycli "mycli" C-m
tmux attach-session -t $SESSION
