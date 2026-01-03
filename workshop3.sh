#!/usr/bin/env bash

read -p "whats your fav food ?  " FOOD
echo "$FOOD sounds great"

if [[ "$FOOD" == "idly" ]]; then
 echo "You might be south indian, because you prefer $FOOD"
else
 echo "since you prefer $FOOD , you might be from other parts of India"
fi
