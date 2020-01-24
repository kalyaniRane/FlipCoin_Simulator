#!/bin/bash -x 

#Declaring dictionary or variables
declare -A FlipCoin_Result
head=0;
tail=0;


echo "Welcome to Flip Coin Simulator"

read -p "Enter the number to flip a coin: " time

#function for flip a coin
function flipACoin()
{
	for((i=1;i<=time;i++))
	do
		random=$((RANDOM % 2))

		if [ $random -eq 0 ]
		then
				FlipCoin_Result[result$((i+1))]="Head"
		else
				FlipCoin_Result[result$((i+1))]="Tail"
		fi
	done
}


#Function for calculate the percentage of coin flipping
function calc_Percentage()
{
	for occure in ${FlipCoin_Result[@]}
	do
		if [ $occure == "Head" ]
		then
				((head++))
		else
				((tail++))
		fi
	done

	echo "Head Occure "$head" times"
	echo "Tail Occure "$tail" time"

	percentageOfHead=$(echo "scale=2; $head * 100 / $time" | bc)
	percentageOfTail=$(echo "scale=2; $tail * 100 / $time" | bc)

	echo "Percentage of Head is: $percentageOfHead"
	echo "Percentage of Tail is: $percentageOfTail"
}

#Function calling
flipACoin
echo "All Occuerence of Coins: "${FlipCoin_Result[@]}
calc_Percentage
