class DancesController < ApplicationController

def index
 @dances = Blurb.where(:cat => 'dance')
end


def show
 @dance = Blurb.where(:cat => 'dance').find(params[:id])
end


end