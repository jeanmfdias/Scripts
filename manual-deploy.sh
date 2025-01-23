#!/bin/bash

echo "## Deploying ..."
echo

update_repo(){
    echo "## Fetching new contents in the repository..."
    git checkout main
    git pull

    if [[ $? -ne 0 ]]
    then
        echo "## It seems went wrong when updating repository, renewing contents..."
        echo
        git checkout dev
        git branch -D main
        git fetch --all --prune
        git checkout main
    fi
}

cd ~/app
update_repo

cd ~/app-qa
update_repo

cd ..

echo "## Cleaning up dangling images, containers and volumes..."
echo
docker system prune -f

docker compose stop

echo "## Restarting server with updated contents..."
echo
docker compose up --build -d

if [[ $? -ne 0 ]]
then
    echo "## Deployed successfully!"
fi

exit 0