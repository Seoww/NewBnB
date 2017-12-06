class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations

	mount_uploaders :pictures, AvatarUploader
	serialize :pictures, JSON
	self.per_page = 10 
end
