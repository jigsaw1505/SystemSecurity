#!/bin/bash

function display_menu() {
  echo "Welcome to Forensics and Malware Analysis Script!"
  echo "Select an option :"
  echo "1) Intrusion Detection System"
  echo "2) Risk assessment"
  echo "3) Network security"
  echo "4) Exit"
}

function intrusion() {
  while true; do
    echo "Intrusion detection techniques"
    echo "1) Normal Intrusion detection"
    echo "2) Live Intrusion detection"
    echo "3) Check whole network"
    echo "4) Exit"
    echo "Select an option"
    cd ids || exit 1
    read -r choice
    case $choice in
    1) bash ids.sh ;;
    2) bash liveids.sh ;;
    3) bash wholenetwork.sh ;;
    4) cd .. && return ;;
    *)
      echo "Invalid choice."
      ;;
    esac
    cd ..
  done
}

function risk() {
  while true; do
    echo "1) Check all currently running processes"
    echo "2) Check all killed processes in last 24 hours"
    echo "3) Check user information and user logins"
    echo "4) Check network connections"
    echo "5) Exit"
    echo "Choose an option"
    cd riskcheck || exit 1
    read -r choice
    case $choice in
    1) bash currentprocess.sh ;;
    2) bash pastprocess.sh ;;
    3) bash user.sh ;;
    4) bash networkcheck.sh ;;
    5) cd .. && return ;;
    *)
      echo "Invalid choice."
      ;;
    esac
    cd ..
  done
}

function network() {
  while true; do
    echo "1. Real time system logs"
    echo "2. Analyze system logs"
    echo "3. Responding to security incident"
    echo "4. To identify cyber threats"
    echo "5. Incident response plan"
    echo "6. Continuous evaluation and enhancing security protocols"
    echo "7. Exit"
    echo "Choose an option"
    cd network || exit 1
    read -r choice
    case $choice in
    1) bash realtimesystemlogs.sh ;;
    2) bash analysis.sh ;;
    3) bash response.sh ;;
    4) bash thread.sh ;;
    5) bash firewall.sh ;;
    6) bash pdca.sh ;;
    7) cd .. && return ;;
    *)
      echo "Invalid choice"
      ;;
    esac
    cd ..
  done
}

while true; do
  display_menu
  read -r choice

  case $choice in
  1) intrusion ;;
  2) risk ;;
  3) network ;;
  4)
    echo "Exiting ..."
    exit 0
    ;;
  *)
    echo "Invalid choice."
    ;;
  esac
done
