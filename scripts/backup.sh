#!/bin/bash

SESSION="backups"

tmux has-session -t $SESSION 2>/dev/null
if [ $? == 0 ]; then
    echo "In session"
    exit 1
fi

tmux new-session -d -s $SESSION

# Navigate to your docker-compose folder and run docker-compose up
tmux send-keys -t $SESSION:1 "cd /home/tyrion/Backup/" C-m

# Run nvim in the top pane
tmux send-keys "nvim ." C-m

# Create a new window for 'jace-components' and run 'npm run watch-poll'
tmux new-window -t $SESSION -n 'container'
tmux send-keys -t $SESSION:2 "cd /home/tyrion/Backup/ && docker-compose up -d && docker exec -it backup-python-app-1 bash" C-m

# Create a new window for 'sockets' and run 'node index.js'
tmux new-window -t $SESSION -n 'git'
tmux send-keys -t $SESSION:3 "cd /home/tyrion/Backup/" C-m

# Attach to the tmux session
tmux attach-session -t $SESSION
