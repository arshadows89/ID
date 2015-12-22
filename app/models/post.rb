class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	belongs_to :post

	validates_length_of :title, :minimum => 5, :maximum => 50, :allow_blank => false

	def self.all_ordered_by_child
    		order('updated_at DESC')
	end

end

# sort by posts...
# when a comment is updated it needs to update posts updated_at....

# 					 number one....

# 2015-12-21 22:05:08  mess things up 24

# 2015-12-22 01:52:38  mess things dasjlkdajsldas

# 2015-12-22 01:52:00  mess things up 25

# 2015-12-21 21:22:43  new top

# 2015-12-21 20:13:22  2nd

# so the issue is if you upadte post it doesnt recgnoize that