#!/bin/bash

is_valid_ipv4() {
    local ipv4=$1
    local regex='^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$'

    if [[ $ipv4 =~ $regex ]]; then
        return 0 # Valid IPv4 format
    else
        return 1 # Invalid IPv4 format
    fi
}

ipv4_addresses=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}')

ipv6_addresses=$(ifconfig | grep -Eo 'inet6 (addr: )?(([0-9a-f]{1,4}:){7,7}[0-9a-f]{1,4}|([0-9a-f]{1,4}:){1,7}:|([0-9a-f]{1,4}:){1,6}:[0-9a-f]{1,4}|([0-9a-f]{1,4}:){1,5}(:[0-9a-f]{1,4}){1,5}|([0-9a-f]{1,4}:){1,4}(:[0-9a-f]{1,4}){1,6}|([0-9a-f]{1,4}:){1,3}(:[0-9a-f]{1,4}){1,7}|([0-9a-f]{1,4}:){1,2}(:[0-9a-f]{1,4}){1,8}|[0-9a-f]{1,4}:((:[0-9a-f]{1,4}){1,8})?)(%.*)?' | awk '{print $2}')

echo "IPv4 Addresses:"
for address in $ipv4_addresses; do
    if is_valid_ipv4 "$address"; then
        echo "$address"
    fi
done

echo "IPv6 Addresses:"
echo "$ipv6_addresses"

