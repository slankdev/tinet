
new-window -n 2nd
split-window -v 'docker exec -it R4 srdump -i net0 -Q in'
split-window -v 'docker exec -it R5 srdump -i net0 -Q in'
select-pane -U
select-pane -U
split-window -v 'docker exec -it R3 srdump -i net0 -Q in'
select-pane -t 0
split-window -v 'docker exec -it R2 srdump -i net0 -Q in'

# ---
# new-window -n 2nd
# split-window -v 'while true; do echo pane 4 ; sleep 1 ; done'
# split-window -v 'while true; do echo pane 6 ; sleep 1 ; done'
# select-pane -U
# select-pane -U
# split-window -v 'while true; do echo pane 2 ; sleep 1 ; done'
# select-pane -t 0
# split-window -h 'while true; do echo pane 1 ; sleep 1 ; done'
# select-pane -D
# split-window -h 'while true; do echo pane 3 ; sleep 1 ; done'
# select-pane -D
# split-window -h 'while true; do echo pane 5 ; sleep 1 ; done'
# select-pane -D
# split-window -h 'while true; do echo pane 7 ; sleep 1 ; done'
# select-pane -t 0
# split-window -v 'while true; do echo pane 0 ; sleep 1 ; done'
