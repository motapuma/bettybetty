class KeyWord < ActiveRecord::Base
	belongs_to :relation_type
	has_and_belongs_to_many :relations
end
