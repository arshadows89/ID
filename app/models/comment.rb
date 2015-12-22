class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	after_save { Post.find(self.post.id).update(:updated_at => Time.now) }

end
