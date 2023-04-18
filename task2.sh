read -p "Enter the number of products you want to find: " stop
read -p "Enter a number to check for multiples: " multiple

while ! [[ "$stop" =~ ^[0-9]+$ ]] || ! [[ "$multiple" =~ ^[0-9]+$ ]]
do
    echo -e "\nPlease enter a range that is valid\n"
    read -p "Enter the number of products you want to find: " stop
    read -p "Enter a number to check for multiples: " multiple
done

for (( num1=2,num2=4,count=1; count<=$stop; num1+=2,num2+=2,count++ ))
do
    ans=$(( $num1*$num2 ))
    echo -en "$num1 x $num2 = $ans"
    if (( ans%multiple == 0 ))
    then
        echo -e " is a multiple of $multiple"
    else
        echo -e " is not a multiple of $multiple"
    fi
done
