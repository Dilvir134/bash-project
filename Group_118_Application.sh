clear

echo -e "\t\tBash Scripting Project by: Dilvir Singh, Shalom Aideyan\n"
echo -e "\t\t-------------------------------------------------------\n"

read -p "Enter your full name: " full_name
echo ""

echo -e "\t\tWelcome $full_name select one of the options\n"
echo -e "\t\t-------------------------------------------------------\n"

echo "1) Continue with application"
echo "2) Exit the program"

read -p "Enter your selection: " selection_first

# validate user selection to make sure it isn't a letter and is either 1 or 2
while (( $selection_first != 1 && $selection_first != 2 )) || ! [[ "$selection_first" =~ ^[0-9]+$ ]]
do
    echo -e "\nEnter a valid number\n"
    echo "1) Continue with application"
    echo "2) Exit the program"

    read -p "Enter your selection: " selection_first
done

task_one() {
    read -p "Enter the starting range: " start
    read -p "Enter the ending range: " stop

    # validate the inputted range to make sure there are no letters and it is a valid range where start is smaller than stop
    while (( $start > $stop )) || ! [[ $start =~ '^[0-9]+$' ]] || ! [[ $stop =~ '^[0-9]+$' ]]
    do
        echo -e "\nPlease enter a range that is valid\n"
        read -p "Enter the starting range: " start
        read -p "Enter the ending range: " stop
    done

    # initialize counting for even and odd numbers
    count_even=0
    count_odd=0

    # Loop adds sequential numbers starting from 1 and adds them to num variable giving us triangualar numbers
    for (( num=1,count=2; num<=$stop; num+=count, count++ ))
    do
        # Makes sure the number user didn't ask for is not printed
        if (( $num > $start ))
        then
            # Even numbers are counted and printed
            if (( $num%2 == 0 ))
            then
                echo "$num"
                count_even=$((count_even + 1))
            # Odd numbers are counted
            elif (( $num%2 == 1 ))
            then
                count_odd=$((count_odd + 1))
            fi
        fi    
    done

    # Checks if there are no results found
    if (( $count_even == 0 && $count_odd == 0 ))
    then
        echo "Sorry there are no triangular numbers in the given range"
    else
        echo "There are $count_even even triangular numbers in the range"
        echo "There are $count_odd odd triangular numbers in the range"
    fi
}

task_two() {
    read -p "Enter the number of products you want to find: " stop
    read -p "Enter a number to check for multiples: " multiple

    # Validates user input
    while ! [[ "$stop" =~ ^[0-9]+$ ]] || ! [[ "$multiple" =~ ^[0-9]+$ ]]
    do
        echo -e "\nPlease enter a range that is valid\n"
        read -p "Enter the number of products you want to find: " stop
        read -p "Enter a number to check for multiples: " multiple
    done

    # Loops from 1 to the number user provided for var stop, with num1 and num2 as even numbers adding two each time
    for (( num1=2,num2=4,count=1; count<=$stop; num1+=2,num2+=2,count++ ))
    do
        ans=$(( $num1*$num2 ))
        echo -en "$num1 x $num2 = $ans"
        # Checks whether or not a result is a multiple of the user provided input
        if (( ans%multiple == 0 ))
        then
            echo -e " is a multiple of $multiple"
        else
            echo -e " is not a multiple of $multiple"
        fi
    done
}

task_three() {
    echo "Enter a:"
    read a
    echo "Enter b:"
    read b
    echo "Enter c:"
    read c

    # Ask the user which option they want
    echo "Which option do you want?"
    echo "1) Find a limited number of terms of the sequence and print them in order."
    echo "2) Find a term in a position chosen by the user and determine whether this term is a factor of a number chosen also by the user."
    read option

    # Option 1
    if [ $option -eq 1 ]
    then
        # Ask the user how many terms they want
        echo "How many terms do you want?"
        read num_terms

        # Calculate and print the terms
        product=1
        for (( n=1; n<=$num_terms; n++ ))
        do
            term=$((a*n*n + b*n + c))
            echo "$term"
            product=$((product * term))
        done

        # Print the product of the terms
        echo "The product of the terms is $product"

    # Option 2
    elif [ $option -eq 2 ]
    then
        # Ask the user which term they want
        echo "Which term do you want?"
        read term_num

        # Calculate the term and print it
        term=$((a*term_num*term_num + b*term_num + c))
        echo "The $term_num term is $term"

        # Ask the user for a number to check
        echo "Enter a number to check if the term is a factor:"
        read check_num

        # Check if the term is a factor of the number
        if [ $((check_num % term)) -eq 0 ]
        then
            echo "This term is a factor of $check_num."
        else
            echo "This term is not a factor of $check_num."
        fi

    else
        echo "Invalid option."
    fi
}

selection_task=0

# Keeps running the menu unless user enters the number 4 to exit the program
while (( $selection_task != 4 ))
do
    # Checks if user inputted for program exit in the start
    if [[ $selection_first == 1 ]]
    then
        echo -e "\n\t\tPlease select which operation you would like to run\n"
        echo -e "\t\t-------------------------------------------------------\n"
        echo -e "1) Triangular Numbers (T, 1)"
        echo -e "2) Check for multiples in a product of numbers (P, 2)"
        echo -e "3) Quadratic Sequences (Q, 3)"
        echo -e "4) Exit the application (E, 4)"

        # No validation required since loop will run unless user selects 4
        read -p "Enter your selection: " selection_task
        echo ""

        if [[ "$selection_task" == "T" || "$selection_task" == "t" || $selection_task == 1 ]]
        then
            task_one
        elif [[ "$selection_task" == "P" || "$selection_task" == "p" || $selection_task == 2 ]]
        then
            task_two
        elif [[ "$selection_task" == "Q" || "$selection_task" == "q" || $selection_task == 3 ]]
        then
            task_three
        elif [[ $selection_task == "E" || $selection_task == "e" || $selection_task == 4 ]]
        then
            break
        fi
    # If user inputted 2 in the start program will end
    elif [[ $selection_first == 2 ]]
    then
        break
    fi
done
