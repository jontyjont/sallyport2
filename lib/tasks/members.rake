namespace :members do
	desc "setup devise re existing passwords"
	task :reset_pwds => :environment do
		Member.all.each do |m|
			m.password = m.password_confirmation = m.password_bak
			m.save!
		end
	end
end