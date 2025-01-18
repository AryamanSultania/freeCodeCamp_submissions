#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo -e "$($PSQL "SELECT SUM (winner_goals + opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo -e "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo -e "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo -e "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo -e "$($PSQL "SELECT MAX(winner_goals) AS goals FROM games  UNION SELECT MAX(opponent_goals) AS goals FROM games ORDER BY goals DESC LIMIT 1")"
#before, only used winning_goals as manual check of data showed the max was in there
#however, it was not a good implementation, so decided to use union to improve.

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo -e "$($PSQL "SELECT COUNT(winner_goals) FROM games WHERE winner_goals>2")"
#count how many goals winning team did

echo -e "\nWinner of the 2018 tournament team name:"
echo -e "$($PSQL "SELECT name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE round='Final' AND year=2018")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo -e "$($PSQL "SELECT name FROM games FULL JOIN teams ON games.opponent_id = teams.team_id WHERE round='Eighth-Final' AND year=2014  UNION SELECT name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE round='Eighth-Final' AND year=2014 ORDER BY name")"
#https://www.postgresql.org/docs/current/queries-union.html

echo -e "\nList of unique winning team names in the whole data set:"
echo -e "$($PSQL "SELECT DISTINCT(name) FROM games FULL JOIN teams ON games.winner_id = teams.team_id GROUP BY name HAVING COUNT(winner_id) > 0 ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo -e "$($PSQL "SELECT year, name FROM games FULL JOIN teams ON games.winner_id = teams.team_id WHERE round='Final' ORDER BY year")"

echo -e "\nList of teams that start with 'Co':"
echo -e "$($PSQL "SELECT DISTINCT(name) FROM teams WHERE name LIKE 'Co%'")"
