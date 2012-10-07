class Article < ActiveRecord::Base
	include Tire::Model::Search
  include Tire::Model::Callbacks
  attr_accessible :author, :tag, :content, :published_at, :title

  mapping do
    indexes :id,           :index    => :not_analyzed
    indexes :title,        :analyzer => 'snowball', :boost => 100
    indexes :content,      :analyzer => 'snowball'
    indexes :author,       :analyzer => 'keyword'
    indexes :tag,       	 :analyzer => 'keyword'
 #   indexes :created_at, 	 :type => 'date',
    indexes :published_at, :type => 'date', :include_in_all => false
  end


	 def self.search(params)
   	tire.search(load: true) do
    		query {string params[:query]} if params[:query].present?
	#			sort 	{by :created_at, 'desc'}

   	end 
	 end
end
