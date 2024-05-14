function display_menu() {
  echo "Welcome to Forensics and Malware Analysis Script!"

 	echo "Select an option :"
	echo "1) Intrusion Detaction System"
	echo "2) Risk assessment"
	echo "3) Network security"
 	echo "4) Exit"
function intrusion () {
	while true; do
   echo "Intrusion detaction techniques"
	echo "3)  Normal Intrusion detaction"
	echo "2)  Live Intrusion detaction"
	echo "3)  Check whole network "
  echo "4)  exit"
  echo "Select a option"
	cd ids
 	read -r choice
  	case $choice in 
	1)
      		bash ids.sh
		;;
  2)
          bash liveids.sh
          ;;
  3)      
          bash wholenetwork.sh
          ;;
  4)
          return
          ;;
  *)
      echo "Invalid choice."
      ;;
          esac
          cd ..
      done
}
function risk () {
echo "1) Check all currenly running processes"
echo "2) Check all killed prosess in last 24 hours"
echo "3) Check user informations and usr logins"
echo "4) Check network connections"
echo "5) Exit"
echo "Choose an option"
cd riskcheck
read -r choice
case $choice in
1) bash currentprocess.sh ;;
2) bash pastprocess.sh ;;
3) bash user.sh ;;
4) bash networkcheck.sh ;;
5) return ;;
*)
      echo "Invalid choice."
      ;;
esac
cd ..
done
}
function networ() {
  while true; do
  echo "1. Real time system logs "
  echo "2. Analyse system logs"
  echo "3. Responding to security incident"
  echo "4. To identify cyber threads"
  echo "5. Incident response plan"
  echo "6. Continuous evalution and inhancing security protocols"
  echo "7. Exit"
  echo "Choose an options"
  cd network
  read -r choice
  case $choice in
  1) realtimesystemlogs.sh ;;
  2) analysis.sh ;;
  3) response.sh ;;
  4) thread.sh ;;
  5) firewall.sh ;;
  6) pdca.sh ;;
  7) return ;;
  *) echo "Invalid choice"
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
    4) echo"Exiting ..."
       exit 0
       ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done
