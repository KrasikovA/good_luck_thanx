#! /bin/bash
bot_pid_file="pid"
kill $(<"$bot_pid_file")

