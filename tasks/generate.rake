require 'active_record'
require 'yaml'
require 'dotenv'
require 'erb'

class GenerateTasks
  include Rake::DSL

  def initialize
    rule '' do |tsk|
      aliastask = tsk.name.sub(/g:/, 'generate:')
      if Rake.application.tasks.map{|tsk| tsk.name }.include?( aliastask )
        Rake.application[aliastask].invoke
      else
        raise RuntimeError, "Don't know how to build task '#{tsk.name}'"
      end
    end

    namespace :generate do
      desc 'Generate migration'
      task :migration do
        name = ARGV[1] || raise('Specify name: rake g:migration your_migration')
        snake_case_name = name.gsub(/(.)([A-Z])/,'\1_\2').downcase
        timestamp = Time.now.strftime("%Y%m%d%H%M%S")
        path = File.expand_path("../../db/migrate/#{timestamp}_#{snake_case_name}.rb", __FILE__)
        migration_class = snake_case_name.split("_").map(&:capitalize).join

        File.open(path, 'w') do |file|
          file.write <<-EOF
class #{migration_class} < ActiveRecord::Migration[5.0]
  def change
  end
end
          EOF
        end

        puts "Migration #{path} created"
        abort
      end
    end
  end
end

GenerateTasks.new
