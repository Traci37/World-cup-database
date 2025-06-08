#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games,teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
do
  if [[ $YEAR != "year" ]]
  then
    # get team_id for winner
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
       
       # if team_id is not available
      if [[ -z $WINNER_ID ]]
      then
        
        # insert name data
        INSERT_WINNER_RECORD=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

        if [[ $INSERT_WINNER_RECORD == "INSERT 0 1" ]]
        then
          echo $WINNER inserted into name
        fi
        # return new team_id for winner
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      fi  

      # get team_id for opponent
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

       # if team_id is not available
      if [[ -z $OPPONENT_ID ]]
      then

      # insert name data
        INSERT_OPPONENT_RECORD=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

        if [[ $INSERT_OPPONENT_RECORD == "INSERT 0 1" ]]
        then
          echo $OPPONENT inserted into name
        fi
        # return new team_id for opponent
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      fi  

    # insert into games table
    INSERT_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_G,$OPPONENT_G)")  
    if [[ $INSERT_RESULT == "INSERT 0 1" ]]
    then
      echo $YEAR,$ROUND,$WINNER_ID,$OPPONENT_ID,$WINNER_G,$OPPONENT_G inserted into games.
    fi  
  fi
done  
