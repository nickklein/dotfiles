#!/bin/bash

# Start a new tmux session named 'chatapp'
SESSION="chatapp"
tmux new-session -d -s $SESSION -n 'nvim'

# Navigate to your docker-compose folder and run docker-compose up
tmux send-keys -t $SESSION:nvim "cd /home/ada/Sites/chatapp/ && docker compose down && docker compose up -d" C-m

# Optional: wait a bit for containers to start up (adjust the sleep duration as needed)
sleep 3

# Run nvim in the top pane
tmux send-keys -t $SESSION:nvim "nvim ." C-m

# Create a new window for 'appwatch'
tmux new-window -t $SESSION -n 'appwatch'
tmux send-keys -t $SESSION:appwatch "cd /home/ada/Sites/chatapp/app" C-m

# Create a new window for 'ssh'
tmux new-window -t $SESSION -n 'ssh'
tmux send-keys -t $SESSION:ssh "cd /home/ada/Sites/chatapp/app/" C-m

# Attach to the tmux session
tmux attach-session -t $SESSION
