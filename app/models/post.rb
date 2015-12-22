class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	belongs_to :post

	def self.all_ordered_by_child
    	includes(:comments).order('comments.updated_at DESC')
	end

end