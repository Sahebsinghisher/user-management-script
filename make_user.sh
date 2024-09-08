#!/bin/bash

# Check if the script is run as root
if [[ "${UID}" -ne 0 ]]
then
    echo 'Please run with sudo or as root'
    exit 1
fi

# Check if at least one argument is provided
if [[ "${#}" -lt 1 ]]
then
    echo "Usage: ${0} USER_NAME [COMMENT]..."
    echo 'Create a user with the name USER_NAME and a comments field of COMMENT'
    exit 1
fi

# Assign the first argument as the username
USER_NAME="${1}"

# Shift arguments to get the comment
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c16)

# Create the user with the provided comment
useradd -c "${COMMENT}" -m "${USER_NAME}"

# Check if the useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
    echo 'The account could not be created'
    exit 1
fi

# Set the password for the user
echo "${USER_NAME}:${PASSWORD}" | chpasswd

# Check if the password command succeeded
if [[ "${?}" -ne 0 ]]
then
    echo 'Password could not be set'
    exit 1
fi

# Expire the password to force a change on first login
passwd -e "${USER_NAME}"

# Display the username, password, and host
echo 
echo "Username: ${USER_NAME}"
echo
echo "Password: ${PASSWORD}"
echo
echo "Hostname: $(hostname)"