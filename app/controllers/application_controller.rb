class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_dances


  def get_dances
  	 @dances = Blurb.where(:cat => 'dance')
  end
end
