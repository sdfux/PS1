#!/bin/bash
# Customizing prompt
user_bg="\[\033[48;5;1m\]"
triangle_user_fg="\[\033[38;5;1m\]"
dir_bg="\[\033[48;5;239m\]"
dir_fg="\[\033[38;5;254m\]"
triangle_dir_fg="\[\033[38;5;239m\]"
time_bg="\[\033[48;5;161m\]"
triangle_time_fg="\[\033[38;5;161m\]"
branch_bg="\[\033[48;5;195m\]"
branch_fg="\[\033[38;5;195m\]"
dollar_bg="\[\033[48;5;161m\]"
black_bg="\[\033[48;5;0m\]"
b_triangle_fg="\[\033[38;5;0m\]"
triangle_dollar_fg="\[\033[38;5;161m\]"

RESET="\[$(tput sgr0)\]"

triangle_user=$(echo -e "${triangle_user_fg}${dir_bg}\uE0B0${RESET}")
triangle_branch=$(echo -e "${RESET}${triangle_dir_fg}\uE0B0${RESET}")
triangle_last=$(echo -e "${triangle_time_fg}\uE0B0")
a_triangle=$(echo -e "${b_triangle_fg}${user_bg}\uE0B0")
b_triangle=$(echo -e "${b_triangle_fg}${dollar_bg}\uE0B0${RESET}")
triangle_dollar=$(echo -e "${triangle_dollar_fg}\uE0B0")


PS1='\n${a_triangle}${RESET}${user_bg}\u:\h${triangle_user}${dir_bg}${dir_fg} \w ${branch_fg} \`parse_git_branch\` ${triangle_branch}\n${b_triangle}${time_bg}\t \$${RESET}${triangle_dollar}${RESET} '



#gabo:gabo-ubuntu ~/Documents/Linux/PS1/3  (main ?)  02:13:01 
#$ 
#PS1="\n${a_triangle}${RESET}${user_bg}\u:\h${triangle_user}${dir_bg}${dir_fg} \w ${branch_fg} \`parse_git_branch\` ${triangle_branch}${time_bg} \t ${RESET}${triangle_last}${RESET}\n${b_triangle}${dollar_bg}${dollar_fg}\$${RESET}${triangle_dollar}${RESET} "

