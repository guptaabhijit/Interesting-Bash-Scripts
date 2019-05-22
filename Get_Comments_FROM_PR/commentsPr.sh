#!/bin/bash


if [ $# -ne 1 ]
  then
    echo "Please pass author name"
    exit 1
    
fi
author=$1

issueURL="https://api.github.com/search/issues?q=author%3A$author"
echo $issueURL
pr_urls=$(curl -X GET   $issueURL   -H "Authorization: Bearer $GIT_TOKEN" | jq '.items[].url')

#echo $pr_urls
myarray_repo=(api dashboard)
for url in $pr_urls
do
	#echo $url
	pr_numbers=$(echo $url | tr  -dc '0-9' )
	
	pr_repo=$(echo $url | cut -d '/' -f6)

	for ((i=0;i<${#pr_numbers[@]};++i)); do

    	case "${myarray_repo[@]}" in  *"$pr_repo"*) 
		
		comment_url="https://api.github.com/repos/razorpay/$pr_repo/pulls/$pr_numbers/comments"
		
		eval "curl -X GET   $comment_url   -H 'Authorization: Bearer $GIT_TOKEN' | jq '.[].body'"	>> response.txt	
		
    	 ;;	 esac
       
	done
done

