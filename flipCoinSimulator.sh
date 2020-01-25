#!/bin/bash -x 

echo "Welcome to Flip Coin Simulator"

#Function to get the input from user
function getInput()
{
	read -p  "Do You Want to Play if yes then press 'y' else press any other key: " play
	while [ $play == 'y' ]
	do
		read -p "Enter how many times you want to flip a coin: " noOfFlip
		echo -e "1.One Coin \n2.Two Coin \n3.Three Coin"
		read -p "Enter your choice: " ch

		case $ch in
				1)
					coins=1
					flipCoin
					;;
				2)
					coins=2
					flipCoin
					;;
				3)
					coins=3
					flipCoin
					;;
				*)
					echo "Enter Valid choice"
					;;
		esac
		read -p  "Do You Want to continue[y/n]: " play
	done
}

#Function to flip the coins
function flipCoin()
{
	key=""

	#declare the dictionary
	declare -A FlipCoin_Result

	for((i=1;i<=noOfFlip;i++))
	do
		for((j=1;j<=coins;j++))
		do
				if (( $((RANDOM%2==0)) ))
				then
						key+=H
				else
						key+=T
				fi
		done
		FlipCoin_Result[$key]=$((${FlipCoin_Result[$key]}+1))
		key=""
	done
	echo "All Key of Dictionary: "${!FlipCoin_Result[@]}
	echo "All Occuerence of FlipCoin in Dictionary: "${FlipCoin_Result[@]}

	#function call for calculating percentage
	calculate_Percentage
}

#Function for calculate the percentage of occuerence of coin
function calculate_Percentage()
{
	for key in ${!FlipCoin_Result[@]}
	do
			FlipCoin_Result[$key]=$(echo "scale=2; ${FlipCoin_Result[$key]} * 100 / $noOfFlip" | bc )
	done

	echo "All Key: "${!FlipCoin_Result[@]}
	echo "Percentage of all occurence of FlipCoin: "${FlipCoin_Result[@]}

	#function call for sort dictionary and find winner
	sort_FlipCoinDict
}

#Function to sort dictionary and display the higher element of dictionary
function sort_FlipCoinDict()
{
	echo "Winner is:"
	for i in "${!FlipCoin_Result[@]}"
	do
			echo -e $i ${FlipCoin_Result[$i]}
	done | sort -k2 -rn | head -1
}

#Function call for start the program
getInput



