class Video < ActiveRecord::Base
	before_save { self.link = link.sub! 'watch?v=', 'embed/' }
	before_save { self.link = link.sub! '&list', '?list' }
	before_save { self.link = link.split("&index=")[0] }
end