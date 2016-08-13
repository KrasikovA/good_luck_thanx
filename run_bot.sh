#!/bin/bash
GOOD_LUCK_THANX=$GOOD_LUCK_THANX nohup ruby $HOME/apps/good_luck_thanx/main.rb &
echo $! > pid 
