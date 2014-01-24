class User < ActiveRecord::Base

	# associations
	has_many :rooms
	has_many :orders

	# built into rails 4
	has_secure_password

	# add in paperclip for users to create an avatar
	has_attached_file :avatar, styles: {large: "320x320#", medium: "140x140#", thumbnail: "50x50#"}

	# validations
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true 

end
