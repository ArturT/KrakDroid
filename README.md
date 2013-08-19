# KrakDroid 2012

Conference Website.

[KrakDroid 2012](http://2012.krakdroid.pl)


# Development env

    /config/database.yml.example.mysql
    /config/database.yml.example.postgresql
    /config/application.yml.example


## Carrierwave gem requires

    # MacOS
    brew install imagemagick
    brew install gs

    # Ubuntu
    sudo apt-get install imagemagick


# Production env

## Basic info

[krakdroid.herokuapp.com](http://krakdroid.herokuapp.com)

    db: postgresql
    git@heroku.com:krakdroid.git

## Config vars

    heroku config:add FTP_HOST=XXX
    heroku config:add FTP_PORT=21
    heroku config:add FTP_USER=XXX
    heroku config:add FTP_PASSWD=XXX
    heroku config:add FTP_FOLDER=/production
    heroku config:add FTP_URL=XXX


## Deploy to Heroku.com

Add heroku to your git remotes:

    $ git remote add heroku git@heroku.com:krakdroid.git

Push only branch `krakdroid-2012` to heroku:

    $ git push heroku krakdroid-2012:master


# API

    /api/speakers.json
    /api/schedules.json
