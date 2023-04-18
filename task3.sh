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

