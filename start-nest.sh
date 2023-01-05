#!/bin/bash
set -e
bash /root/start.sh

echo "$USUARIO, $PROYECTO, $DB_NAME" > /home/datos_entry.txt


config_git(){
    npm cache clean --force
    rm -rf /var/www/html/$PROYECTO
    rm -rf .git
    mkdir /var/www/html/${PROYECTO}/
    cd /var/www/html/${PROYECTO}
    
    
    git config --global init.defaultBranch master
    git config --global http.sslverify false
    git init
    git remote add origin ${GITHUB}
    git branch -m master
    git pull origin master
    cd /var/www/html/${PROYECTO}/api
}


config_nest(){
    
    echo "DB_HOST=${DB_HOST}" > ./.env
    echo "DB_PORT=5432" >> ./.env
    echo "DB_USERNAME=${DB_USERNAME}" >> ./.env
    echo "DB_PASSWORD=${DB_PASSWORD}" >> ./.env
    echo "DB_NAME=${DB_NAME}" >>./.env
    echo "GITHUB=${GITHUB}" >>./.env

    npm install && npm run start:dev

}

main(){
    
    config_git
    config_nest
    tail -f /dev/null 
}
main