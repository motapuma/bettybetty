class Link < ActiveRecord::Base
	has_many :relations
	has_many :allies,    through: :relations
	has_many :candidates,through: :relations 
	has_many :relation_types,through: :relations 

	has_attached_file :pdf
	validates_attachment_content_type :pdf, :content_type => ['application/pdf']
	
	belongs_to :candidate, inverse_of: :can_especial_links
	belongs_to :ally, inverse_of: :all_especial_links

end
