#!/bin/bash
# Menu Driven DevOps Tool
# Description: A simple utility shell UI for everyday infrastructure checks.

show_menu() {
    echo "============================="
    echo "    DEVOPS UTILITY TOOL      "
    echo "============================="
    echo "1. Check CPU Usage"
    echo "2. Check RAM Utilization"
    echo "3. Restart SSH Service"
    echo "4. Backup System Logs"
    echo "5. Exit"
    echo "============================="
    echo -n "Enter your choice [1-5]: "
}

while true; do
    show_menu
    read -r choice
    case $choice in
        1)
            echo -e "\n--- Current CPU Status ---"
            top -bn1 | grep "Cpu(s)"
            echo ""
            ;;
        2)
            echo -e "\n--- Current Memory Status ---"
            free -h
            echo ""
            ;;
        3)
            echo -e "\n--- Restarting SSH ---"
            sudo systemctl restart ssh && echo "SSH service restarted successfully."
            echo ""
            ;;
        4)
            echo -e "\n--- Backing up Log Files ---"
            BACKUP_DIR="./backup_logs"
            mkdir -p "$BACKUP_DIR"
            # On Kali, we will backup /var/log/auth.log which is usually accessible
            tar -czf "$BACKUP_DIR/auth_log_$(date +%F).tar.gz" /var/log/auth.log 2>/dev/null
            echo "Backup saved under $BACKUP_DIR"
            echo ""
            ;;
        5)
            echo "Exiting Tool. Goodbye!"
            exit 0
            ;;
        *)
            echo -e "\nInvalid choice. Please pick an option between 1 and 5.\n"
            ;;
    esac
    # Pauses the loop until user presses enter to keep UI looking clean
    read -p "Press [Enter] to continue..."
done
