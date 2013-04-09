#encoding: utf-8
class HomesController < ApplicationController

def index
  @intro= Blurb.find_by_name('Homepage')
end

def contact_us
  session[:start_time] = Time.now
end

def help
 @blurb = Blurb.find_by_name("Help for Visitors")
end

def useful_links
  @blurb = Blurb.find_by_name ("sites")
end



def send_message
  if session[:start_time] > (Time.now - 15.seconds)
    flash[:error] = "Sorry I do not believe you are human, no message sent"
    session[:start_time] = nil
    redirect_to '/' and return
  end
	message = Hashie::Mash.new(params[:message])
 	AdminMailer.contact_admin(message).deliver
	flash[:success] = "Your message has been sent to our admin members, you can expect a reply within a day"
  redirect_to '/'
end





end