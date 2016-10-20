ENV['RACK_ENV']||='development'

require 'data_mapper'
require_relative './bookmark_manager.rb'

task default: [:spec]
p "hello"
p ENV["RACK_ENV"]

namespace :db do

  desc 'Non desctructive upgrade'
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts "Auto upgrade complete "
  end

  desc 'Destructive upgrade'
    task :auto_migrate do
      DataMapper.auto_migrate!
      puts "Auto Migrate (Data Loss)"
  end

end
