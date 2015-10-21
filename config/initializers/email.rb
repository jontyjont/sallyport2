if Rails.env.production?

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app12937424@heroku.com',
  :password       => 'zhkhevcz5502'
  
}

ActionMailer::Base.delivery_method ||= :smtp

end