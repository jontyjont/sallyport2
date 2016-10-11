class ServicesController < ApplicationController

  before_filter :basic_auth

  def new_ip
    @ip = Rails.cache.read("the_ip_address").to_s
  end

  def set_ip
    @ip = params[:ip][:number]
    Rails.cache.write("the_ip_address", @ip)
    flash[:notice] = "set ip address"
    redirect_to '/'
  end

  def tvheadend
    ip = Rails.cache.read("the_ip_address")
    raise ActiveRecord::RecordNotFound unless ip.present?
    tvh = "http://#{ip}:9002/ext.js"
    redirect_to tvh
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "sallyservices" && password == "rapp3rdanc!ng"
    end
  end
end