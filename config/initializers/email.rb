if Rails.env.production?

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'app12937424@heroku.com',
  :password       => 'wgvw1bhk'
  
}

ActionMailer::Base.delivery_method ||= :smtp

end