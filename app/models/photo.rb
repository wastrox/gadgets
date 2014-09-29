class Photo < ActiveRecord::Base
	attr_accessor :photo
	validates_presence_of :photo
	has_attached_file :photo, :styles => { full: '2048x2048>',:medium => "250x250>", :thumb => "100x100>" }#, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  	belongs_to :imageable, polymorphic: true
end
