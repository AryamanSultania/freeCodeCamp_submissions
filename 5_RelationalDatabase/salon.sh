#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[  !  -z  $1  ]] #if an argument is passed, echo it
  then
    echo "$1"
  fi

  SERVICE_NAMES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICE_NAMES" | while read SERVICE_ID BAR NAME 
  do
    echo "$SERVICE_ID) $NAME"
  done
  
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) MENU_APPOINTMENT 1 "Cut" ;;
    2) MENU_APPOINTMENT 2 "Colour" ;;
    3) MENU_APPOINTMENT 3 "Perm" ;;
    4) MENU_APPOINTMENT 4 "Style" ;;
    *) MAIN_MENU "Sir, this is a salon, not a Burger King. Try again." ;;
  esac

}

MENU_APPOINTMENT() {
  echo $1
  echo $2

  #check phone number, are they a current or new customer?
  echo "What is your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[  -z  $CUSTOMER_NAME  ]]
  then #if name is null, make account!
    echo -e "\nAccount not found, what's your name?"
    read CUSTOMER_NAME  
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  
  
  fi
  #cool, at this part, there should be an account now, whether they just made one or had one before.
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo "$CUSTOMER_NAME $CUSTOMER_PHONE $CUSTOMER_ID"

  echo -e "\nWhat time would you like your appointment to be?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMER_ID','$1','$SERVICE_TIME')")

  echo -e "I have put you down for a $2 at $SERVICE_TIME, $CUSTOMER_NAME."
  
}


#MAIN_MENU "hoi hoi"
MAIN_MENU
