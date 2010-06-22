require "./init"

Main.set :run, false
Main.set :environment, ENV['RACK_ENV'] || :production

logger = ::File.open("log/production.log", "a+")
STDOUT.reopen(logger)
STDERR.reopen(logger)

Main.use Rack::CommonLogger, logger

run Main
