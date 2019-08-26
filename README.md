# README

    mini note book(https://lucas-to-do-app.herokuapp.com/)
    
![](to-do-demo.gif)

### Clone the repo

    git clone https://github.com/tangyuan1808/to-do-list.git
    
### Set up Environment

##### Mac User

* Install Ruby(rbenv is the ruby manager)

        brew install rbenv        
        echo 'eval "$(rbenv init -)"' > ~/.bash_profile
        source ~/.bash_profile
        rbenv install 2.6.2
        
* Install Bundler(ruby package manager)
        
        gem install bundler -v 2.0.1
        bundle
                
* Set up database(postgreSQL)
        
        brew install postgres
        pg_ctl -D /usr/local/var/postgres start
        bundle exec rake db:create db:migrate
        
* Start application server         

        bundle exec rails s

* Stop database
    
        pg_ctl -D /usr/local/var/postgres stop
        
##### Other User

    Please use Docker

#### How to run test

* Set up test database

        RAILS_ENV=test bundle exec rake db:migrate     

* Run unit test(rspec) 

        bundle exec rspec
        
* Run feature test(cucumber), only support chrome 75
        
        bundle exec cucumber

#### Docker

* Build Docker Image

        docker build -t to-do-list .

* Run application using docker

        docker run --rm -p 3000:3000 to-do-list

* Run test using docker 
 
        docker run --rm -t to-do-list bundle exec rspec 
    
                 
#### Technology Stack

    Ruby 2.6.2
    Rails 5.2.3
    cucumber 
    rspec 
    postgreSQL
        
         
