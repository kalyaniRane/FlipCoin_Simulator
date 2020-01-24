#!/bin/bash -x


echo "Welcome to Flip Coin Simulator"

#function for flip a coin
function flipACoin()
{
	random=$((RANDOM % 2))

	if [ $random -eq 0 ]
	then
			echo "Head"
	else
			echo "Tail"
	fi
}

#Function Calling
flipACoin
