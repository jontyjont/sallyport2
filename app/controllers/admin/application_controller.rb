class Admin::ApplicationController < ApplicationController

before_filter :authenticate_member!
before_filter :is_admin!


private

def is_admin!
 unless	current_member.is_admin?
 	redirect_to '/', notice: "Sorry not allowed to visit that page"
 end
end



end