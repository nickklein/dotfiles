#!/bin/bash

# Start a new tmux session named 'chatapp'
SESSION="intiveo"
tmux new-session -d -s $SESSION

tmux send-keys -t $SESSION:1 "cd /home/nickklein/projects/intiveo" C-m

# Split window
tmux split-window -v

# Select the top pane
tmux select-pane -U
tmux send-keys "nvim ." C-m

# Make the bottom pane smaller by moving the divider up by lines
tmux resize-pane -D 30

# Create 'admin-process' window and set up panes
tmux new-window -t $SESSION -n "admin-process"
tmux send-keys "cd /home/nickklein/projects/intiveo/process" C-m # This command targets the new window correctly.
tmux split-window -h                                             # Split the window horizontally to create a pane for 'admin'
tmux select-pane -t 0                                            # Select the first pane explicitly
tmux send-keys "cd /home/nickklein/projects/intiveo/admin" C-m

# Create 'manager-dso' window and set up panes
tmux new-window -t $SESSION -n "manager-dso"
tmux send-keys "cd /home/nickklein/projects/intiveo/universal-admin" C-m # This command targets the new window correctly.
tmux split-window -h                                                     # Split the window horizontally to create a pane for 'manager'
tmux select-pane -t 0                                                    # Select the first pane explicitly
tmux send-keys "cd /home/nickklein/projects/intiveo/manager" C-m

# Optionally, you can navigate back to the first pane or any other pane
tmux select-pane -t 1

tmux new-window -t $SESSION -n "mycli"
tmux send-keys -t $SESSION:mycli "mycli" C-m
tmux attach-session -t $SESSION
