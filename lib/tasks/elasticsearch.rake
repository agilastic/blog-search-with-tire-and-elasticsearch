namespace :elasticsearch do
  task :recreate_index => :environment do
  	Article.all.each do |a|
  		a.tire.update_index
  	end
  end
end