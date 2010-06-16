APP_NAME
========

Setup instructions
------------------

  First: install Redis 2.0rc1, if you haven't yet:
  http://code.google.com/p/redis/

    curl http://redis.googlecode.com/files/redis-2.0.0-rc1.tar.gz | tar -zxvf -
    cd redis-2.0.0-rc1
    make
    sudo cp redis-{server,cli,benchmark,check-aof,check-dump} /usr/local/bin
    cd ..
    rm -rf redis-2.0.0-rc1

  Install Ruby Version Manager, if you haven't yet:

    bash < <(curl http://rvm.beginrescueend.com/releases/rvm-install-head)

  Install Ruby 1.9.1 on RVM, if you haven't yet:

    rvm install 1.9.1

  Create the rvmrc file. From this point forward, doing `cd` to your directory
  will automatically load Ruby 1.9.1 with the project's gemset, which will be
  created if it doesn't exist:

    echo rvm --create use 1.9.1@APP_NAME > .rvmrc
    source .rvmrc

  Install some required gems:

    gem install treetop polyglot mutter

  Create the Redis db paths for both test and development:
    
    mkdir -p db/redis/{test,development}

Sample data
-----------

You can set up sample seed data for testing out the app.
    
    monk redis      # Start redis (if you haven't yet)
    rake seed

Running
-------

    monk redis [test|development] # Start redis (if you haven't yet)
    monk start [test|development|production]

Deploying
---------

  This builds the compressed CSS/JS files.
  Make sure that the app is running before doing this.

    rake minify
