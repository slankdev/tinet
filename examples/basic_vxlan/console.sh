#!/bin/sh

tmux rename-window name
tmux split-window -v 'docker exec -it R0 bash'
tmux split-window -v 'docker exec -it R1 bash'
tmux split-window -v 'docker exec -it C0 bash'
tmux split-window -v 'docker exec -it C1 bash'

