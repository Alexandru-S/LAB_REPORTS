# no params
cd ~/Desktop/Projects/Self/WebDev/syzible/

if [ "$#" == 0 ]; then
	nodemon
# > 0 params
else
	if [ "$1" == "start" ]; then
		nodemon
	elif [ "$1" == "push" ]; then
		git checkout master
		git add .
		git commit -m "$2"
		if [ "$3" == "" ]; then
			git push -u origin master
		else
			git push -u origin "$3"
		fi
	elif [ "$1" == "update" ]; then
		git pull origin master;
	elif [ "$1" == "merge" ]; then
		git merge "$2"
	elif [ "$1" == "branch" ]; then
		git checkout -b "$2"
	elif [ "$1" == "checkout" ]; then
		git checkout "$2"
	elif [ "$1" == "deploy" ]; then
		git checkout production
		if [ "$2" == "" ]; then
			git merge master
		else
			git merge "$2"
		fi
		git push -u origin production
		git checkout master
	else
		echo "Not a command";
	fi
fi
