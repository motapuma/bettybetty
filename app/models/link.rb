class Link < ActiveRecord::Base
	has_many :relations
	has_many :allies,    through: :relations
	has_many :candidates,through: :relations 
	has_many :relation_types,through: :relations 

end
