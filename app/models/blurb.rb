class Blurb < ActiveRecord::Base
	after_save :parse_practices

  validates  :name, :content, :presence => true

	def unfold_for_links
		self.content.split("\r\n").map{|l| l.split("#")}
	end

	private

	def parse_practices
		return unless self.name == 'practices'
		  Practice.destroy_future!
      parser = PracticeParser.new
      parser.parse
	end

end
