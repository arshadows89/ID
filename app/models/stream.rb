class Stream < ActiveRecord::Base
	# VALID_LINKS = %w(www.twitch.tv/)
	# validates_inclusion_of :link, :in => VALID_LINKS

	# before_save { self.link = link.sub! 'watch?v=', 'embed/' }
	# before_save { self.link = link.sub! '&list', '?list' }
	# before_save { self.link = link.split("&index=")[0] }
	before_save { self.streamer = streamer.split.map(&:capitalize).join(' ')}
	before_save { self.link = link.downcase}
	validates :streamer, presence: true
	validates :link, presence: true, format: {
		with: /(?:https?:\/\/)?www\.twitch(?:\.tv)?\/?.([-\w-_]+)/,
		message: 'must be a valid link'
	}
end
