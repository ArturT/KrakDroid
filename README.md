# KrakDroid

Conference Website


# Development env

    /config/database.yml.example.mysql
    /config/database.yml.example.postgresql
    /config/application.yml.example


## Carrierwave gem requires

    # MacOS
    $ brew install imagemagick
    $ brew install gs

    # Ubuntu
    $ sudo apt-get install imagemagick


# Production env

## Basic info

[krakdroid2013.herokuapp.com](http://krakdroid2013.herokuapp.com)

    db: postgresql
    git@heroku.com:krakdroid2013.git

## Config vars

    $ heroku config:add FTP_HOST=XXX
    $ heroku config:add FTP_PORT=21
    $ heroku config:add FTP_USER=XXX
    $ heroku config:add FTP_PASSWD=XXX
    $ heroku config:add FTP_FOLDER=/production
    $ heroku config:add FTP_URL=XXX


# API

    /api/speakers.json
    /api/schedules.json


# Deploy

    $ git remote add krakdroid2013 git@heroku.com:krakdroid2013.git

    # deploy
    $ git push krakdroid2013 master
