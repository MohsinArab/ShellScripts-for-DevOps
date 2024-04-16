#!/bin/bash

# Array for fortune messages
fortunes=(
    "Do it scared."
    "You are your best thing."
    "A good friend is a treasure."
    "Life is journey not a destination."
    "All your hard work will soon pay off."
    "Don't just think, act!"
    "It is better to be alone than in bad company."
    "Never give up. You're not a failure if you don't give up."
    "You are very talented in many ways."
)

# Function to display a random fortune message
display_fortune() {
    # Get a random index from fortunes array
    index=$((RANDOM % ${#fortunes[@]}))
    # Print the fortune message at the random index
    echo "${fortunes[$index]}"
}

# Infinite loop to continuously display fortune messages
while true; do
    echo "Fortune of the day:"
    display_fortune
    sleep 2
done