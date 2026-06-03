#!/bin/bash
# Automated User Onboarding
# Description: Reads usernames from a file, creates Linux accounts, and generates secure credentials.

USER_FILE="users.txt"

if [ ! -f "$USER_FILE" ]; then
    echo "Error: Input file '$USER_FILE' not found! Create it first."
    exit 1
fi

# Clear any previous mock notifications to start fresh
> email_mock_notifications.txt

# Loop through each line in the text file
while IFS= read -r username || [ -n "$username" ]; do
    # Skip empty lines or comments
    [[ -z "$username" || "$username" =~ ^# ]] && continue

    # Trim white spaces
    username=$(echo "$username" | xargs)

    echo "Processing onboarding for: $username"

    # Check if user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping creation."
    else
        # Generate a random 12-character alphanumeric password
        PASSWORD=$(openssl rand -base64 12 | tr -dc 'a-zA-Z0-9' | head -c 12)

        # Create user account with home directory
        sudo useradd -m "$username"
        
        # Set the user password
        echo "$username:$PASSWORD" | sudo chpasswd
        
        # Force user to change password on first login
        sudo chage -d 0 "$username"

        echo "Account created successfully."

        # Simulate the Email Notification Output
        echo "--------------------------------------------------" >> email_mock_notifications.txt
        echo "TO: $username@company.local" >> email_mock_notifications.txt
        echo "SUBJECT: Welcome to the Engineering Infrastructure Office" >> email_mock_notifications.txt
        echo -e "\nHello $username,\n\nYour deployment account is ready." >> email_mock_notifications.txt
        echo "Username: $username" >> email_mock_notifications.txt
        echo "Temporary Password: $PASSWORD" >> email_mock_notifications.txt
        echo "Note: You will be required to change your password upon your first login." >> email_mock_notifications.txt
        echo "--------------------------------------------------" >> email_mock_notifications.txt
    fi
done < "$USER_FILE"

echo "Onboarding process completed. Check 'email_mock_notifications.txt' for credentials."


