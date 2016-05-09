class Blurb < ActiveRecord::Base
	after_save :parse_practices

	def unfold_for_links
		self.content.split("\r\n").map{|l| l.split("#")}
	end

	private

	def parse_practices
      parser = PracticeParser.new
      parser.parse
	end

end