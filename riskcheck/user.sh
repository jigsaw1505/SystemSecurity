chu(){
  echo"Checking for current users"
  w
}
chru(){
  echo"Checking last user login activities"
  last
}
quite(){
  echo"Quiting the script"
  cd ..
}
while true; do
echo "Check User login activities "

    echo"1.Check Current users "
    echo"2.Check recent users "
    echo"Select an option or enter q for quite "
    read -p "Enter your choice :" choice
    case $choice in
      1)
        chu
        ;;
      2)
        chru
        ;;
      3)
        exit
        ;;
        esac
        done
        
