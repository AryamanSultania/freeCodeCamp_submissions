#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing -t --no-align -c"

echo "Enter your username:"
read INPUT_USERNAME

#check if username is in database
SEARCH_USERNAME=$($PSQL "SELECT username FROM players WHERE username='$INPUT_USERNAME'")

if [[  -z  $SEARCH_USERNAME  ]]
then
  #create useranme
  INSERT_USERNAME=$($PSQL "INSERT INTO players(username) VALUES ('$INPUT_USERNAME')")

fi

USERNAME=$($PSQL "SELECT username FROM players WHERE username='$INPUT_USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE username='$INPUT_USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE username='$INPUT_USERNAME'")

if [[  -z  $INSERT_USERNAME  ]]
then
  #echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $INPUT_USERNAME! It looks like this is your first time here."
fi

#reminded of $RANDOM by https://stackoverflow.com/q/2556190
#tested further on my personal linux device

RANDOM_NUMBER=$(($RANDOM/33))
#echo $RANDOM_NUMBER
TRIES_COUNT=1
#did some testing, realized that instead of 0 it should be 1


GUESS_NUMBER() {
  if [[  !  -z  $1  ]]
  then
    echo $1
  fi

  read USER_GUESS

  #echo "you have made $TRIES_COUNT guesses, ans is $RANDOM_NUMBER"

  #got a reminder of =~ from https://askubuntu.com/a/1174149
  ##mmm we love regex
  if [[  !  $USER_GUESS =~ [0-9]  ]]
  then
    TRIES_COUNT=$(($TRIES_COUNT+1))
    GUESS_NUMBER "That is not an integer, guess again:"
  fi

  if ((  $USER_GUESS == $RANDOM_NUMBER  ))
  then
    echo "You guessed it in $TRIES_COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi

  if ((  $USER_GUESS  <  $RANDOM_NUMBER ))
  then
    TRIES_COUNT=$(($TRIES_COUNT+1))
    #got reference from https://askubuntu.com/a/385532
    GUESS_NUMBER "It's higher than that, guess again:"
  fi

  if ((  $USER_GUESS  >  $RANDOM_NUMBER ))
  then
    TRIES_COUNT=$(($TRIES_COUNT+1))
    GUESS_NUMBER "It's lower than that, guess again:"
  fi

}

echo "Guess the secret number between 1 and 1000:"
GUESS_NUMBER

#increment games played value
#if this is a better try count, then update that too

if ((  $BEST_GAME > $TRIES_COUNT  |  $BEST_GAME  ==  1  ))
then
  UPDATE_STATS_BEST=$($PSQL "UPDATE players SET best_game=$TRIES_COUNT WHERE username='$USERNAME'")
fi

#UPDATED_GAMES_PLAYED=$(($GAMES_PLAYED+1))

#UPDATE_STATS_PLAYS=$($PSQL "UPDATE players SET games_played=$UPDATED_GAMES_PLAYED WHERE username='$USERNAME'")
UPDATE_STATS_PLAYS=$($PSQL "UPDATE players SET games_played=$(($GAMES_PLAYED+1)) WHERE username='$USERNAME'")

#not sure if it helped, but this forum post led me to change SQL default for best_game from 0 to 1 (which does make sense
#https://forum.freecodecamp.org/t/stuck-at-number-guessing-game-relational-database/
