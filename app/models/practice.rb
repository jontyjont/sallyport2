class Practice < Event

  def self.next_practice
     Practice.where("\"when\" >= ?", Time.zone.now.end_of_day ).order("\"when\" ASC").first
  end

  def self.destroy_future!
    future_pracs = self.where("\"when\" > ?", Date.today)
    future_pracs.destroy_all if future_pracs.to_a.any?
  end


end
