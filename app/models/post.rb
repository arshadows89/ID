class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	belongs_to :post
	accepts_nested_attributes_for :comments

	validates_length_of :title, :minimum => 5, :maximum => 50, :allow_blank => false

	def self.all_ordered_by_child
    		order('updated_at DESC')
	end


end
