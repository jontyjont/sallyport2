class HomesController < ApplicationController

def index
  choices=("Winlaton,Newbiggin,Swalwell,Beadnell,Murton,Poppleton").split(",")
  choices.each do |dance|
  	b = Blurb.where("name like ? ", "%#{dance}%").first
  	b.cat = "dance"
  	b.save
  end
  flash[:notice] = "updated blurbs"
  @intro= Blurb.where(:name=>'Homepage').first
end



end