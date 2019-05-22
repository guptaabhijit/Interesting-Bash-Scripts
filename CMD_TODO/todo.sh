#!/usr/bin/env bash



#usage: sh todo.sh -p ===> to print all tasks
#usage: sh todo.sh -a <add any task name>
#usage: sh todo.sh -r <task number> ===> to remove any task


array=()

addTask()
{
  if [ ! -f ~/.todo/list.txt ]; then
    if [ ! -d ~/.todo ]; then mkdir ~/.todo; fi
    touch ~/.todo/list.txt
  fi
  echo "$1       ;      $(date)" >> ~/.todo/list.txt
}

print_todo()
{
	if [ -f ~/.todo/list.txt ]; then
		checkEmpty=$(cat ~/.todo/list.txt)
		if [[ $checkEmpty == "" ]]; then
			echo "No tasks found"
		else
			count="0"
			IFS=$'\n' 
			for task in $(cat ~/.todo/list.txt); do
				#array+="$count.) $task"
				count=$(( $count + 1 ))
				echo "$count.) $task"
			done
			
			#for each in "${array[@]}"
			#do
			#	echo "$each\n"
				#counter=$(( $counter+1 ))
			#done
		fi
	else
		echo "No tasks found"
	fi
}

removeTask()
{
	taskNumberToRemove=$1

	if [ -f ~/.todo/list.txt ]; then
		checkEmpty=$(cat ~/.todo/list.txt)
		if [[ $checkEmpty == "" ]]; then
			echo "No tasks found"
		else
			IFS=$'\n'
			mycount="1"
			flag=false
			taskarray=()	
			for task in $(cat ~/.todo/list.txt); do
				echo $mycount
				if [ $taskNumberToRemove == $mycount ]; then
					echo "removing $taskNumberToRemove"
					flag=true
				else
					taskarray+="$task\n"
				fi
				mycount=$(( $mycount+1 ))
			done
			if [ $flag == true ]; then
				echo "removed"
				delete=$(rm -rf ~/.todo/list.txt)
				touch ~/.todo/list.txt
				echo "${taskarray[@]}"

				for each in "${taskarray[@]}"
				do
					echo "$each" >> ~/.todo/list.txt
				done

			else
				echo "not removed"
			fi
		fi
	else
		echo "No tasks found"
	fi
}

command=$1

case $command in
    -a)
    addTask "$2"
    ;;

    -p)
	print_todo
    ;;
    
    -r)
	removeTask "$2"
	;;

    *)
       printf "no action defined"
       ;;
    esac


