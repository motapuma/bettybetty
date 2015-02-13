class Candidate < ActiveRecord::Base
	
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_many :nicknames
	accepts_nested_attributes_for :nicknames, :allow_destroy => true,reject_if: :nick_invalid

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
