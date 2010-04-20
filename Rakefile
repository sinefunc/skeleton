desc 'Default task: run all tests'
task :default => [:test]

task :test do
  exec "thor monk:test"
end

namespace :test do
  task :unit do
    exec "thor monk:test_unit"
  end
end
