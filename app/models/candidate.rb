class Candidate < ActiveRecord::Base
	
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_many :nicknames
	has_many :can_especial_links, inverse_of: :candidate,class_name: "Link" 
	
	accepts_nested_attributes_for :nicknames, :allow_destroy => true,reject_if: :nick_invalid
	accepts_nested_attributes_for :can_especial_links, :allow_destroy => true

	has_many :relations
	has_many :allies,    through: :relations
	has_many :links,through: :relations 
	 
	has_many :relation_types,through: :relations 

	private

    def nick_invalid(attributes)
      # office name shouldn't start with underscore
      attributes['nick'] == ""
    end

end
