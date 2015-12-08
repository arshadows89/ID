class Stream < ActiveRecord::Base
	before_save { self.streamer = streamer.split.map(&:capitalize).join(' ')}
	before_save { if self.link.include?("https://")
					self.link = link.downcase
				  else
					self.link = ("http://" + link).downcase 
				  end}
	validates :streamer, presence: true
	validates :link, format: {
		with: /(?:https?:\/\/)?www\.twitch(?:\.tv)?\/?.([-\w-_]+)/,
		message: 'must be a valid twitch link EX. "www.twitch.tv/username"'
	}
end
