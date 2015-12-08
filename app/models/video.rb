class Video < ActiveRecord::Base
	before_save { if self.link.include?("https://")
					self.link = link.sub('watch?v=', 'embed/').split("?list")[0].split("&list")[0]
				  else
					self.link = "https://" + link.sub('watch?v=', 'embed/').split("?list")[0].split("&list")[0]
				  end	
				}
	before_save { self.text = text.split.map(&:capitalize).join(' ')}
	# validates :link, presence: true
	validates :text, presence: true
	validates :link, format: {
		with: /(?:https?:\/\/)?(?:www\.)?youtube(?:\.com)?\/?.*(?:watch|embed)?(?:.*v=|v\/|\/)([-\w-_]+)/,
		message: 'must be a valid youtube link'
	}
	# validates_format_of :website, :with => URI::regexp(%w(http https))
	# validates_format_of :link, :with => /^http:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/
end