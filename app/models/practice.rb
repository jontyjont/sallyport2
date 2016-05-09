class Practice < Event

def self.next_practice
  pracs = Practice.where("\"when\" > ?", Date.today).order("\"when\" ASC").first
end


end