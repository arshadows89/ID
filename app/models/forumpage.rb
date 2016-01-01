class Forumpage < ActiveRecord::Base
	has_many :posts
	belongs_to :forum
end