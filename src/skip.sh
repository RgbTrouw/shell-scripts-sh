# copyright rgbtrust 2026  
# -> skip first and last characters of a string  
# ./skip.sh <count> <count>  
  
left=$1;  
right=$2;  
  
read line;  
size=$(printf $line | wc -m);  
  
printf $line | tail -c $(($size - $left)) | head -c $(($size - $right - $left));  