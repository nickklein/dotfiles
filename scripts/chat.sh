#!/bin/bash

# Start a new tmux session named 'chatapp'
SESSION="chatapp"
tmux new-session -d -s $SESSION

# Stop all running Docker containers
tmux send-keys -t $SESSION:1 "docker stop \$(docker ps -a -q)" C-m

# Navigate to your docker-compose folder and run docker-compose up
tmux send-keys -t $SESSION:1 "cd /home/tyrion/Sites/chatapp/ && docker-compose up -d" C-m

# Run nvim in the top pane
tmux send-keys "nvim ." C-m

# Optional: wait a bit for containers to start up (adjust the sleep duration as needed)
sleep 3

# Create a new window for 'appwatch' and run 'npm run dev'
tmux new-window -t $SESSION -n 'appwatch'
tmux send-keys -t $SESSION:2 "cd /home/tyrion/Sites/chatapp/app" C-m

# Create a new window for 'jace-components' and run 'npm run watch-poll'
tmux new-window -t $SESSION -n 'jace-components'
tmux send-keys -t $SESSION:3 "cd /home/tyrion/Sites/chatapp/node-packages/jace-node" C-m

# Create a new window for 'sockets' and run 'node index.js'
tmux new-window -t $SESSION -n 'sockets'
tmux send-keys -t $SESSION:4 "cd /home/tyrion/Sites/chatapp/app/" C-m

# GIT
tmux new-window -t $SESSION -n 'git'
# Split the window into two panes, vertically
tmux split-window -h

# Split the first pane horizontally, creating two panes on the left
tmux select-pane -t 1
tmux split-window -v

# Split the second pane (top right) horizontally, creating two panes on the right
tmux select-pane -t 3
tmux split-window -v

# Navigate to the first panel and go to the regular app
tmux select-pane -t 1
tmux send-keys -t $SESSION:git "cd /home/tyrion/Sites/chatapp/app && npm run dev" C-m

tmux select-pane -t 2
tmux send-keys -t $SESSION:git "cd /home/tyrion/Sites/chatapp/node-packages/jace-node && npm run watch-poll" C-m

tmux select-pane -t 3
tmux send-keys -t $SESSION:git "cd /home/tyrion/Sites/chatapp/app/ && node server.js" C-m

# Optionally, you can navigate back to the first pane or any other pane
tmux select-pane -t 1

# Attach to the tmux session
tmux attach-session -t $SESSION
