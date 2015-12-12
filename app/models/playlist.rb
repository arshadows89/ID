class Playlist < ActiveRecord::Base
	before_save { 
	  if self.link.include?("https://")
		self.link = link
	  else
		self.link = "https://" + link
	  end	
	}
		validates :link, presence: true
	validates :link, format: {
		with: /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:embed\/)(?:videoseries\?list=))(((?:\w|-|_){24}))?(?:\S+)?/,
		message: 'must be a valid embed youtube playlist'
	}
end