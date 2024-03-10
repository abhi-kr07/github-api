**prerequisite :-**

1. ```sudo apt install jq -y```
2. ```export username="abhi-kr07"```
3. ```export token="<your-github-token>"```

4. ```./list_user.sh <organization-owner(abhishek-yoyo)> <repo-name(github-api)>```


Note - you're trying to use the curl command with the -u option, which is used for specifying a username and password for HTTP basic authentication
        ```curl -s -u username:password https://example.com/api/resource```
