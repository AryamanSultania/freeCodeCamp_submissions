#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#define all the functions here

PROPERTY_OUTPUT() {
  #echo "insert ptoperty here!!"
  #echo $1

  #atomic_number from any
  ATOMIC_NUMBER=$1
  #symbol from elements
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  #name from elements
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
  ##type from .sh lookup
  TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  #atomic_mass from properties
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  #melting_point_celsius from properties
  MELTING_POINT_CELSIUS=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  #boiling_point_celsius from properties
  BOILING_POINT_CELSIUS=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

  #determine type from type_id
  #1 = nonmetal
  #2 = metal
  #3 = metalloid
  TYPE="undefined"
  case $TYPE_ID in
    1) TYPE="nonmetal" ;;
    2) TYPE="metal" ;;
    3) TYPE="metalloid" ;;
    *) TYPE="undefined" ;;
  esac

  echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
}


#The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.



ELEMENT_LOOKUP() {
  #echo "wow you got me here $1"
  #should do a scan, how to check if valid?
  #null! if null then yeet user out
  #if not null, then take a bit more seriously, each value into their own var

  #let'#let's bruteforce? HEHAHAHA
  ROW_FOUND=0
  ATOMIC_NUMBER=0

  while [[  $ROW_FOUND=0  ]]
  do
    #check for all 3 possible data inputs


    #for symbol
    SEARCH_SYMBOL=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    #echo $SEARCH_ATOMIC_NUMBER
    if [[  !  -z  $SEARCH_SYMBOL  ]]
    then
      ROW_FOUND=1
      ATOMIC_NUMBER=$SEARCH_SYMBOL
      break
    fi

    #for name
    SEARCH_NAME=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    #echo $SEARCH_NAME
    if [[  !  -z  $SEARCH_NAME  ]]
    then
      ROW_FOUND=1
      ATOMIC_NUMBER=$SEARCH_NAME
      break
    fi


    #for atomic number
    SEARCH_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    #echo $SEARCH_ATOMIC_NUMBER
    if [[  !  -z  $SEARCH_ATOMIC_NUMBER  ]]
    then
      ROW_FOUND=1
      ATOMIC_NUMBER=$SEARCH_ATOMIC_NUMBER
      break
    fi

    break
  done

  if [[  $ROW_FOUND -eq 1  ]]
  #got -eq flag from https://superuser.com/a/1400807
  then
    PROPERTY_OUTPUT $ATOMIC_NUMBER
  else
    echo "I could not find that element in the database."
  fi


}

#can't be in a function, any args passed from the terminal directly should be handled here
if [[  -z  $1  ]]
then
  echo "Please provide an element as an argument."
else
  ELEMENT_LOOKUP $1
fi

