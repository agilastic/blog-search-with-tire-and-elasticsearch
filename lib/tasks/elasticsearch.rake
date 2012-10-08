namespace :elasticsearch do
  task :recreate_index => :environment do
    @data_tables = ActiveRecord::Base.connection.tables
    @data_tables.delete("schema_migrations")
    @data_tables.each do |single_table|
      model = single_table.capitalize.singularize.constantize
      model.all.each do |a|
  	a.tire.update_index
      end
    end
  end
end