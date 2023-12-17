#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
RESET='\e[0m'

declare -i counter=1
declare -i hits=0
declare -i miss=0
declare -a numbers

echo "Step: ${counter}"
read -p "Please enter number from 0 to 9 (q - quit): " input

while :
do
  number=${RANDOM: -1}
  case "${input}" in
      [0-9])
          echo "Valid input"
          if (( number == input ))
            then
              hits+=1
              echo "Hit! My number: ${number}"
              number_string="${GREEN}${number}${RESET}"
            else
              miss+=1
              echo "Miss! My number: ${number}"
              number_string="${RED}${number}${RESET}"
          fi
          numbers+=(${number_string})
      ;;
      q)
          echo "Bye"
          echo "Exit..."
          break
      ;;
      *)
          echo "Not valid input, expected number from 0 to 9"
          echo "Please repeat"
      ;;
  esac

  counter+=1

  total=$(( hits + miss ))
  if (( total == 0))
    then
      hit_percent=0
      miss_percent=0
    else
      let hit_percent=hits*100/total
      let miss_percent=100-hit_percent
  fi

  echo "Hit: ${hit_percent}%" "Miss: ${miss_percent}%"
  let limit=10
  if (( total < 10 ))
    then
      limit=total
  fi
  echo -e "Numbers: ${numbers[@]: -limit}"

  echo "Step: ${counter}"
  read -p "Please enter number from 0 to 9 (q - quit): " input
done
