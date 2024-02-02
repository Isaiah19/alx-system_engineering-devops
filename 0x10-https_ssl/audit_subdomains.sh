#!/bin/bash

# Function to display information about a subdomain
display_info() {
    local domain=$1
    local subdomain=$2

    # Use dig to get the DNS record information
    record_info=$(dig +short $subdomain.$domain)

    # Determine the record type
    record_type=$(echo "$record_info" | awk 'NR==1{print $1}')

    # Determine the destination IP
    destination=$(echo "$record_info" | awk '{print $1}')

    # Display the information
    echo "The subdomain $subdomain is a $record_type record and points to $destination"
}

# Main function
main() {
    local domain=$1
    local subdomain=$2

    # Check if subdomain is provided, else use default subdomains
    if [ -z "$subdomain" ]; then
        subdomains=("www" "lb-01" "web-01" "web-02")
    else
        subdomains=("$subdomain")
    fi

    # Iterate through subdomains and display information
    for sub in "${subdomains[@]}"; do
        display_info $domain $sub
    done
}

# Check if required arguments are provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <domain> [subdomain]"
    exit 1
fi

# Call the main function with provided arguments
main "$1" "$2"

