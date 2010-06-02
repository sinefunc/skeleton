APP_NAME
========

Setup instructions
------------------

  First: install Redis 2.0rc1, if you haven't yet.
  http://code.google.com/p/redis/

    wget http://redis.googlecode.com/files/redis-2.0.0-rc1.tar.gz -O - | tar -zxvf -
    cd redis-2.0.0-rc1
    make
    sudo cp {redis-server,redis-cli,redis-benchmark,redis-check-aof,redis-check-dump} /usr/local/bin
    cd ..
    rm -rf redis-2.0.0-rc1

  Install Ruby Version Manager, if you haven't yet.

    bash < <(curl http://rvm.beginrescueend.com/releases/rvm-install-head)

  Install Ruby 1.9.1 on RVM, if you haven't yet.

    rvm install 1.9.1
    rvm 1.9.1             # Switch to ruby 1.9.1

  Make a gemset for APP_NAME.

    rvm gemset create APP_NAME

  Create the rvmrc file, then switch to the created gemset. From this point
  forward, doing `cd` to your directory will automatically load Ruby 1.9.1
  with the new gemset.

    echo rvm 1.9.1@APP_NAME > .rvmrc
    source .rvmrc

  Install some required gems.

    gem install treetop polyglot mutter

  Use the Redis sample conf.

    cp config/redis/development.example.conf config/redis/development.conf

Sample data
-----------

You can set up sample seed data for testing out the app.
    
    monk redis      # Start redis (if you haven't yet)
    rake seed

Running
-------

    monk redis      # Start redis (if you haven't yet)
    monk start

Deploying
---------

  This builds the compressed CSS/JS files.
  Make sure that the app is running before doing this.

    rake minify
