# Andemenos dot com

It's based on Rails 4.2.1 and Ruby 2.2.1.

## How to use
**First step:** Clone the repository

    git clone
    git@bitbucket.org:luizpicolo/andemenos.com.git

**Second step:** Change the database configuration and execute the below commands

    cp config/database.example.yml config/database.yml &&
    cp config/application.example.yml config/application.yml &&
    cp config/secrets.example.yml config/secrets.yml

**Third step:** Within of your project, execute this command

    bundle install && rake db:create && rake db:migrate && rake db:seed
    
or 
```
cp config/database.example.yml config/database.yml &&
cp config/application.example.yml config/application.yml &&
cp config/secrets.example.yml config/secrets.yml &&
value=`cat .ruby-gemset` &&
sed -i "s/db/$value/g" config/database.yml &&
gem install bundle &&
bundle install &&
rake db:create &&
rake db:migrate &&
rake db:seed
```

## Run server

______
Create with <3 by Luiz Picolos  
