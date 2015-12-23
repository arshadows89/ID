class Forum < ActiveRecord::Base
	has_many :posts
	belongs_to :forumtype
	accepts_nested_attributes_for :posts

	def to_param
		title
	end
end