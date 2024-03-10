#!/bin/bash

# Github API URL
API_URL="https://api.github.com"

#Github USERNAME and PERSONAL ACCESS TOKEN
USERNAME=$username
TOKEN=$token

# User and Repo information
#repo-owner=abhishek-yono , 
REPO_OWNER=$1
REPO_NAME=$2


function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # send a get request to the Github API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"       
}


function list_user_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
    
    #Fetch the list of user or collaborators having read access
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permission.pull == true) | .login')"

    #print the list of user with read access 
    if [ -z "$collaborators" ] 
    then
        echo "No user with read access found in ${REPO_OWNER}/${REPO_NAME}"
    else
        echo "User with read access to ${REPO_OWNER}/{REPO_NMAE}:"
        echo "$collaborators"
    fi
}

#Main Script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}.."
list_user_with_read_access
