read -p "Enter the starting range: " start
read -p "Enter the ending range: " stop

while (( $start > $stop )) || ! [[ "$start" =~ ^[0-9]+$ ]] || ! [[ "$stop" =~ ^[0-9]+$ ]]
do
    echo -e "\nPlease enter a range that is valid\n"
    read -p "Enter the starting range: " start
    read -p "Enter the ending range: " stop
done

count_even=0
count_odd=0

for (( num=1,count=2; num<=$stop; num+=count, count++ ))
do
    if (( $num > $start ))
    then
        if (( $num%2 == 0 ))
        then
            echo "$num"
            count_even=$((count_even + 1))
        elif (( $num%2 == 1 ))
        then
            count_odd=$((count_odd + 1))
        fi
    fi    
done

if (( $count_even == 0 && $count_odd == 0 ))
then
    echo "Sorry there are no triangular numbers in the given range"
else
    echo "There are $count_even even triangular numbers in the range"
    echo "There are $count_odd odd triangular numbers in the range"
fi
