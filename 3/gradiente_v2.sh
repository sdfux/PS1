

#!/bin/bash
unset rgb_steps;
unset grad_b_symbol;
IFS=', ' read -r -a rgbini <<< "58,58,58"
IFS=', ' read -r -a rgbfin <<< "215,0,95"
colorsteps=6
let stepshalf=$((colorsteps/2-1))

let step_r=$((rgbini[0] - rgbfin[0]))
step_r=$((step_r*-1/colorsteps))
let step_g=$((rgbini[1] - rgbfin[1]))
step_g=$((step_g*-1/colorsteps))
let step_b=$((rgbini[2] - rgbfin[2]))
step_b=$((step_b*-1/colorsteps))

rgb_steps[0]=${rgbini[0]},${rgbini[1]},${rgbini[2]}
temp_r=${rgbini[0]}
temp_g=${rgbini[1]}
temp_b=${rgbini[2]}

black_fg="\[\033[38;5;0m\]"
grad_triangle="\\uE0B0"
grad_half="\\uE0B1"
grad_symbol="$grad_half"


max=$((colorsteps-1))
for i in $(seq 0 $max)
do

    if [[ ${i} -eq $stepshalf ]]; then
        grad_b_symbol="${grad_b_symbol}\n"

        grad_triangle_mid_color="2;$temp_r;$temp_g;$temp_b"
        temp_r=$((temp_r+step_r))
        temp_g=$((temp_g+step_g))
        temp_b=$((temp_b+step_b))
        continue;

    fi
    if [[ ${i} -eq $max ]]; then
        temp_r=${rgbfin[0]}
        temp_g=${rgbfin[1]}
        temp_b=${rgbfin[2]}
        #grad_symbol=" $grad_triangle"
    fi

    rgb_steps[i]=$temp_r,$temp_g,$temp_b
    

    grad_user_bg_c="2;$temp_r;$temp_g;$temp_b"

    
    echo -e "\e[38;${grad_user_bg_c}m${grad_symbol}"
    echo color ${grad_user_bg_c}
    grad_user_bg="\[\e[48;${grad_user_bg_c}m\]"
    echo user-bg $grad_user_bg
    #PS1=$grad_b_symbol
    grad_b_symbol=${grad_b_symbol}$(echo -e "${black_fg}${grad_user_bg}${grad_symbol}")
    #echo $grad_b_symbol
    #grad_b_symbol=$(echo -e $grad_b_symbol)



    temp_r=$((temp_r+step_r))
    temp_g=$((temp_g+step_g))
    temp_b=$((temp_b+step_b))
    #grad_symbol="$grad_half"
    
done

grad_first=$(sed 's/\\n/X/' <<< $grad_b_symbol | awk -F"X" '{print $1}')
grad_second=$(sed 's/\\n/X/' <<< $grad_b_symbol | awk -F"X" '{print $2}')
grad_triangle=$(echo -e "${RESET}\[\e[38;${grad_triangle_mid_color}m\]\uE0B0${RESET}")


PS1="${grad_first}${grad_triangle=}\n${grad_second}${RESET}"

#PS1="${grad_b_symbol}${RESET}"

