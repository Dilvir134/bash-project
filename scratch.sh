sum=0
n=0
while [ n -le 5  ]
do
      echo "The next number is $n"
      sum=$[$sum+$n]
      n=$[n+1]
done
echo "The sum is $sum"