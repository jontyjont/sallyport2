class DancesController < ApplicationController

def index
 @dances = Blurb.where(:cat => 'dance')
 @dance = @dances.where("name like '%Newbiggin%'").first
end


def show
 @dance = Blurb.where(:cat => 'dance').find(params[:id])
 respond_to do |format|
 	format.js
 end
end


end