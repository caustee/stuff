#!/usr/bin/env bash

# Matrix-style hacker script with real commands, random delays, infinite loop, and real system prompt
# Save original directory
ORIG_DIR=$(pwd)

# Function for random sleep between 3-15 seconds
random_sleep() {
  # Generate random number between 3 and 15
  sleep_time=$(( $RANDOM % 13 + 3 ))
  sleep $sleep_time
}

# Function to simulate command execution with prompt using real system values
simulate_command() {
  # Get actual username and hostname from system
  USER=$(whoami)
  HOST=$(hostname)
  
  # Current directory for the prompt
  DIR=$(pwd | sed "s|$HOME|~|")
  
  # Standard bash-style prompt with real system values
  PROMPT="\033[1;32m$USER@$HOST\033[0m:\033[1;34m$DIR\033[0m\$ "
  
  # Print the prompt
  echo -ne "$PROMPT"
  
  # Small pause like someone is typing
  sleep 0.5
  
  # Type the command character by character
  for (( i=0; i<${#1}; i++ )); do
    echo -n "${1:$i:1}"
    sleep 0.05
  done
  
  # Newline after command
  echo ""
  
  # Execute the actual command
  eval "$1"
}

# Clear screen to start
clear

# Infinite loop - will run until manually terminated
while true; do
  # System reconnaissance
  simulate_command "uname -a"
  random_sleep
  simulate_command "hostname"
  random_sleep
  simulate_command "whoami"
  random_sleep
  simulate_command "id"
  random_sleep

  # Network scanning
  simulate_command "ifconfig | grep inet"
  random_sleep
  simulate_command "netstat -tuln | head -n 8"
  random_sleep
  simulate_command "ping -c 1 8.8.8.8"
  random_sleep

  # Filesystem operations
  simulate_command "cd /"
  random_sleep
  simulate_command "ls -la | grep ^d | sort -R | head -n 5"
  random_sleep
  simulate_command "cd /etc"
  random_sleep
  simulate_command "find . -type f -name \"*.conf\" | head -n 4"
  random_sleep
  simulate_command "grep -l \"password\" *.conf 2>/dev/null | head -n 2"
  random_sleep

  # Process investigation
  simulate_command "ps aux | sort -nrk 3,3 | head -n 6"
  random_sleep
  simulate_command "top -b -n 1 | head -n 12"
  random_sleep

  # User data reconnaissance
  simulate_command "cd ~"
  random_sleep
  simulate_command "du -sh * 2>/dev/null | sort -hr | head -n 5"
  random_sleep
  simulate_command "find . -type f -size +1000k -exec ls -lh {} \\; 2>/dev/null | head -n 4"
  random_sleep

  # Random file access
  simulate_command "RANDOM_FILE=\$(find / -type f -size -10k 2>/dev/null | sort -R | head -n 1)"
  random_sleep
  simulate_command "echo \$RANDOM_FILE"
  random_sleep
  simulate_command "ls -la \"\$RANDOM_FILE\" 2>/dev/null"
  random_sleep
  simulate_command "file \"\$RANDOM_FILE\" 2>/dev/null"
  random_sleep
  simulate_command "head -n 2 \"\$RANDOM_FILE\" 2>/dev/null"
  random_sleep

  # System resource inspection
  simulate_command "free -m"
  random_sleep
  simulate_command "df -h | grep -v tmp"
  random_sleep
  simulate_command "vmstat 1 3"
  random_sleep

  # "Cracking" simulation
  simulate_command "cd /tmp"
  random_sleep
  for i in {1..3}; do 
    simulate_command "echo \$RANDOM | md5sum | head -c 16"
    random_sleep
  done
  simulate_command "find / -perm -4000 -user root 2>/dev/null | sort -R | head -n 3"
  random_sleep

  # More advanced hacking simulation
  simulate_command "nmap -F 127.0.0.1 2>/dev/null || echo \"Scanning localhost ports...\""
  random_sleep
  simulate_command "for i in {1..5}; do printf \"Attempting SSH breach: [\"; for j in {1..20}; do printf \"#\"; sleep 0.1; done; printf \"] Failed\\n\"; done"
  random_sleep
  
  # More filesystem traversal
  simulate_command "cd /var"
  random_sleep
  simulate_command "ls -la | grep ^d"
  random_sleep
  simulate_command "cd log 2>/dev/null || cd /var/log"
  random_sleep
  simulate_command "ls -ltr | tail -n 5"
  random_sleep
  simulate_command "grep -i \"error\" *.log 2>/dev/null | head -n 3"
  random_sleep

  # Check running services
  simulate_command "systemctl list-units --type=service --state=running | head -n 7 2>/dev/null || service --status-all 2>/dev/null || echo \"Enumerating running services...\""
  random_sleep

  # Final system sweep
  simulate_command "lsof -i -P -n | grep LISTEN | head -n 5 2>/dev/null || echo \"Checking for open ports...\""
  random_sleep
  simulate_command "last | head -n 3"
  random_sleep
  simulate_command "journalctl -p 3 -xb --no-pager | tail -n 4 2>/dev/null || echo \"Checking system logs for critical entries...\""
  random_sleep

  # Return to original directory before next loop iteration
  simulate_command "cd \"$ORIG_DIR\""
  random_sleep
  
  # Add some hacker-movie style flair
  simulate_command "echo \"Access cycle complete. Initiating new penetration sequence...\""
  random_sleep
done
