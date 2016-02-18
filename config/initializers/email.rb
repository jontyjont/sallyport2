if Rails.env.production?

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USENAME'],
  :password       => ENV['SENDGRID_PASSWORD']
  
}

ActionMailer::Base.delivery_method ||= :smtp

end