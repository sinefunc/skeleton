desc "Seeds the database"
task :seed do
  require './init'
  require 'spawn'
  require 'ffaker'
  require './test/factories'

  puts "Seeding..."
  Ohm.flush

  # repeat "Users", 1_000 do
  #   User.spawn
  # end

  puts "Done!"
end

def repeat(message, count)
  chunk = [1, (count/100)].max
  count.times do |i|
    if (i % chunk == 0) or (i == count-1)
      perc = (100 * (i+1) / count)
      progress = "%-40s" % ("=" * (40 * (i+1) / count) + ">")[0...40]
      print "\r  %-20s [%s] %4s of %i" % [message, progress, "#{perc}%", count]
    end
    yield
  end
  print "\n"
end
