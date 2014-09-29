class Gadget < ActiveRecord::Base
	validates_presence_of :title

	belongs_to :user
	has_many :photos, as: :imageable
end
