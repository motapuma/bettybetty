class Ally < ActiveRecord::Base
	has_many :nicknames
	accepts_nested_attributes_for :nicknames, :allow_destroy => true

	has_many :relations
	has_many :relation_types,    through: :relations
	has_many :links,through: :relations 
	has_many :candidates,through: :relations 
end
