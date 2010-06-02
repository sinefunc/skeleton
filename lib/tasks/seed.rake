desc "Seeds the database"
task :seed do
  require 'init'
  require 'spawn'
  require 'test/factories'

  Ohm.flush

  # 1_000.times do
  #   User.spawn
  # end

  puts "Done!"
end
