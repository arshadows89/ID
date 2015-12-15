class Homepagenew < ActiveRecord::Base
	before_save { self.title = title.titleize}
	before_save { self.news = news.gsub(/([a-z])((?:[^.?!]|\.(?=[a-z]))*)/i) { $1.upcase + $2.rstrip }}
	validates :news, presence: true
	validates :title, presence: true
end