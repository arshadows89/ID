class Video < ActiveRecord::Base
	before_save { self.link = link.sub! 'watch?v=', 'embed/' }
	before_save { self.link = link.sub! '&list', '?list' }
	before_save { self.link = link.split("&index=")[0] }
	before_save { self.text = text.split.map(&:capitalize).join(' ')}
	# validates :link, presence: true
	validates :text, presence: true
	validates :link, presence: true, format: {
		with: /(?:https?:\/\/)?(?:www\.)?youtube(?:\.com)?\/?.*(?:watch|embed)?(?:.*v=|v\/|\/)([-\w-_]+)/,
		message: 'must be a valid link'
	}
	# validates_format_of :website, :with => URI::regexp(%w(http https))
	# validates_format_of :link, :with => /^http:\/\/www\.youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/
end