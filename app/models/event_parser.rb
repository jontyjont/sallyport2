class EventParser

attr_accessor :blurb

def initialize
	@blurb = Blurb.find_by_name("Google Doc").content
end



end