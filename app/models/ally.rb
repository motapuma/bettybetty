class Ally < ActiveRecord::Base
	
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	has_many :nicknames
	accepts_nested_attributes_for :nicknames, :allow_destroy => true

	has_many :relations
	has_many :relation_types,    through: :relations
	has_many :links,through: :relations 
	has_many :candidates,through: :relations 
end
