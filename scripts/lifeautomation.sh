#!/bin/bash
#WIP

# Start a new tmux session named 'lifeautomation'
SESSION="lifeautomation"
tmux new-session -d -s $SESSION

# Stop all running Docker containers
tmux send-keys -t $SESSION:1 "docker stop \$(docker ps -a -q)" C-m

# Navigate to your docker-compose folder and run docker-compose up
tmux send-keys -t $SESSION:1 "cd $HOME/Sites/lifeautomation/core/ && docker compose up -d" C-m

# Run nvim in the top pane
tmux send-keys "cd ../ && nvim ." C-m

# Optional: wait a bit for containers to start up (adjust the sleep duration as needed)
sleep 3

# Create a new window for 'appwatch' and run 'npm run dev'
tmux new-window -t $SESSION -n 'lifeautomation'
tmux send-keys -t $SESSION:2 "cd $HOME/Sites/lifeautomation" C-m

# Attach to the tmux session
tmux attach-session -t $SESSION
