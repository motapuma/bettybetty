class Nickname < ActiveRecord::Base
	belongs_to :candidate
	belongs_to :ally
end
