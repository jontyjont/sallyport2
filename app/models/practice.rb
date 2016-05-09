class Practice < Event

def self.next_practice
   Practice.where("\"when\" > ?", Date.today).order("\"when\" ASC").first
end


end