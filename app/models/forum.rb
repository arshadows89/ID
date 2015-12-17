class Forum < ActiveRecord::Base
	has_many :posts
	belongs_to :forumtype

	def to_param
		title
	end
end