class Blurb < ActiveRecord::Base
	attr_accessible :cat, :name, :content

	def unfold_for_links
		self.content.split("\r\n").map{|l| l.split("#")}
	end

end