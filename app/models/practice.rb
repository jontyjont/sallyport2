class Practice < Event

def self.next_practice
   Practice.where("\"when\" >= ?", Time.zone.now.end_of_day ).order("\"when\" ASC").first
end


end