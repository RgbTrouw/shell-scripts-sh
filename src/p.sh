# © RgbTrust 2026
# detached process lock (management)
# ./p.sh

echo "1" > $0.lock;
while true;
lock=$(head -c 1 $0.lock);

if(($lock == 1))
then

echo "working...";
sleep 1;
clear;

else 
exit 1;

fi
done&

# echo "0" > p.sh.lock;
