#!/bin/bash

echo =======================
echo    System Dashboard
echo =======================
printf 'User: %s\n' "$(whoami)"
printf 'Hostname: %s\n' "$(hostname | awk -F'-' '{print $1,$2,$3}')"
printf 'OS: %s\n' "$OSTYPE"
printf 'Uptime: %s\n' "$(uptime | awk -F',' '{print $1}'| cut -d' ' -f5)"
printf 'Default shell: %s\n' "$SHELL"
echo ---------------
printf 'CPU:%s\n' "$(grep -m 1 'model name' /proc/cpuinfo | cut -d':' -f2 )"
printf 'RAM: %s/%s\n' "$(free -h | awk '/^Mem:/ {print $3}')"  "$(free -h | awk '/^Mem:/ {print $2}')"
printf 'Disk: %s/%s\n' "$(df -h . | awk 'NR==2 {print $4}')" "$(df -h . | awk 'NR==2 {print $2}')"
echo ---------------
printf 'IP Address: %s\n' "$(hostname -I)"
printf 'packages: %s installed\n' "$(dpkg -l | grep '^ii' | wc -l)"
printf 'Last Login: %s\n' "$(last -n 1 "$USER" | awk 'NR==1 {print $4, $5, $6, $7}')"
echo =======================
