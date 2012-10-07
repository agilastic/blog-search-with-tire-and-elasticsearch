class User < ActiveRecord::Base
  attr_accessible :alter, :beschreibung, :name, :vorname
end
