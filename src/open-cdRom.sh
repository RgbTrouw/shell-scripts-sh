# Copyright 2026 RgbTrust
# ./open-cdRom.sh - Mouse Button Script for Console
# Press button to open Cd-Rom
# (Change Mouse Name and Screen Resolution to fit your needs)

printf '\033[?25l'          # Hide cursor
trap 'printf "\033[?25h"' EXIT  # Restore cursor on exit

clear;
printf '\033[23;42H || > \n                                          Open CD-ROM';
height=$(tput lines);
width=$(tput cols);

topPad=129;
bottomPad=1866;

mouseX=0;
mouseY=0;

xinput test "PixArt lenovo USB Optical Mouse" | while true; do 
read event; 

#echo "$event";
header=$(printf "$event" | head -c 6);
if [ "$header" == "motion" ];
then

if [ $(printf "$event" | grep -o -E "a.0.=([0-9]){1,4}" --color=never -c) -gt 0 ];
then
mouseX=$(printf "$event" | grep -o -E "a.0.=([0-9]){1,4}" --color=never | sed -E "s/a.0.=//g");
fi

if [ $(printf "$event" | grep -o -E "a.1.=([0-9]){1,4}" --color=never -c) -gt 0 ];
then
mouseY=$(printf "$event" | grep -o -E "a.1.=([0-9]){1,4}" --color=never | sed -E "s/a.1.=//g");
fi
#echo "mouseX=$mouseX mouseY=$mouseY"; 
fi

if [ "$event" == "button press   1" ];
then
#echo "Mouse Pressed";

if (( $mouseY >= $topPad && $mouseY <= $bottomPad )); then

#printf "o";
cursorX=$(echo "$width/1080 * $mouseX" | bc -l | grep -o -E "[0-9]{1,4}" | head -n 1 );
cursorY=$(( (mouseY - topPad) * (height - 1) / (bottomPad - topPad) ));

clear;

printf '\033[23;42H || > \n                                          Open CD-ROM';

printf '\033[%d;%dH*' "$((cursorY + 1))" "$((cursorX + 1))";

if (( $cursorX > 40 && $cursorX < 52 && $cursorY > 21 && $cursorY < 26)); then
eject;
fi

fi
fi
done;

