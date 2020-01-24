#!/bin/bash 

echo "Welcome to Flip Coin Simulator"


#Function to get the input from user
function getInput()
{
	local play=0
	read -p  "Do You Want to Play if yes then press 'Y' else press any other key" play
	while [ $play == 'y' ]
	do
		read -p "Enter how many times you want to flip a coin: " noOfFlip
		echo -e "1.One Coin \n2.Two Coin"
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
				*)
					echo "Enter Valid choice"
					;;
		esac
		read -p  "Do You Want to Play if yes then press 'y' else press any other key" play
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
	echo ${!FlipCoin_Result[@]}
	echo ${FlipCoin_Result[@]}

	Calculate_Percentage
}

#Function for calculate the percentage of occuerence of coin
function Calculate_Percentage()
{
	for key in ${!FlipCoin_Result[@]}
	do
			FlipCoin_Result[$key]=$((${FlipCoin_Result[$key]} * 100 / $noOfFlip))
	done

	echo ${!FlipCoin_Result[@]}
	echo ${FlipCoin_Result[@]}
}

#Function call for start the program
getInput



