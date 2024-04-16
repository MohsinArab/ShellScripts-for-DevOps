#!/bin/bash

# created function to perform currency conversion
currency_converter() {
    local amount="$1"
    local from_currency="$2"
    local to_currency="$3"
    
    # used API to exchange rate
    exchange_rate=$(curl -s "https://api.exchangeratesapi.io/latest?base=$from_currency&symbols=$to_currency" | jq -r ".rates.$to_currency")
    
    # Perform conversion
    converted_amount=$(echo "$amount * $exchange_rate" | bc)
    
    # Priented Output
    echo "$amount $from_currency is equivalent to $converted_amount $to_currency"
}

# loop for continuous input
while true; do
    # user input
    read -p "Enter amount in local currency: " amount
    read -p "Enter local currency code (e.g., INR, USD): " from_currency
    read -p "Enter the currency code you want to convert to (e.g., INR, USD): " to_currency
    
    # Perform conversion
    currency_converter "$amount" "$from_currency" "$to_currency"
done