#!/bin/bash

# 1. Hello World
learningbash="Hello World"
echo $learningbash

# 2. Echo Command
provider="MyServer"
echo "The best hosting provider is $provider"

# 3. Loops (While and For)

n=0
while [ $n -lt 3 ]
do
  echo Countdown: $n
  ((n++))
done

for (( n=2; n<=5; n++ ))
do
  echo "$n seconds"
done

# 4. Create an Array
IndexedArray=(egg burger milk)
for i in "${IndexedArray[@]}"; do 
  echo "$i"
done

# 5. Conditional Statements
salary=1000
expenses=800
if [ $salary == $expenses ]; then
  echo "Salary and expenses are equal"
else
  echo "Salary and expenses are not equal"
fi

# 6. Functions
hello () {
  echo "Hello World from a function!"
}
hello

# 7. Display String Length
mystring="lets count the length of this string"
i=${#mystring}
echo "Length: $i"

# 8. Extract String
cut -d , -f 5 <<< "Website,Domain,DNS,SMTP,5005"
expr substr "458449MyServer4132" 7 9

# 9. Find and Replace String
first="I drive a BMW and Volvo"
second="Audi"
echo "${first/BMW/$second}"

# 10. Concatenate Strings
string1="My"
string2="Server"
string3=$string1$string2
echo $string3

# 11. Test if File Exists
MyFile=nonexistent.txt
if [ -f "$MyFile" ]; then
  echo "$MyFile exists."
else
  echo "$MyFile does not exist."
fi

# 12. System Information
echo "Date:"
date
echo "Uptime:"
uptime
