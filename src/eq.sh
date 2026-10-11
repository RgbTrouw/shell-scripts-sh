# equaliser.sh
# Copyright 2026 rgbTrust
# equaliser model script - colored
# (no flicker print)
# usage eq.sh <nrOfLines> <delay>

while true;
do
i=0;
screen="";
until [ $i -gt $1 ];
do
screen="$screen\n";
screen="$screen   [";
#printf $screen;
g=$(shuf -i 0-56 -n 1);

l=0;
        until [ $l -eq $g ];
        do screen="$screen=";
        l=$(($l + 1));
        done
#       screen="$screen|| ";
#       until [ $l -gt 55 ];
#       do screen="$screen=";
#       l=$(($l + 1 ));
#       done
        screen="$screen|| ";
until [ $l -gt 55 ];
do
if [ $l -ge 36 ]
then
screen="$screen\x1b[38;2;0;255;0m=";

fi
if [ $l -lt 36 ]
then
if [ $l -gt 18 ]
then
screen="$screen\x1b[38;2;255;255;0m=";
fi
fi
if [ $l -le 18 ]
then
screen="$screen\x1b[38;2;255;0;0m=";

fi
        #screen="$screen|| ";
        #until [ $l -gt 55 ];
        #screen="$screen=";
        l=$(($l + 1 ));
        done
        screen="$screen\x1b[38;2;255;255;255m";
        screen="$screen]   ";

i=$(($i+1));

done
clear;
printf "$screen";

sleep $(shuf -i 0-$2 -n 1);
#sleep 1;
done
