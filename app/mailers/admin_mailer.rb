class AdminMailer < ActionMailer::Base

	default :to => Member.admin_emails

def contact_admin(message)
	@message = message

	mail :from => @message.email, :subject => @message.subject do |format|
		format.html
	end

end


end