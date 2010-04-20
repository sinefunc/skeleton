desc 'Default task: run all tests'
task :default => [:test]

desc "Run all tests"
task :test do
  exec "thor monk:test"
end

namespace :test do
  desc "Run all unit tests"
  task :unit do
    exec "thor monk:test_unit"
  end
  
  desc "Run all route tests"
  task :routes do
    exec "thor monk:test_routes"
  end

  desc "Run all stories"
  task :stories do
    exec "thor monk:stories"
  end
end
