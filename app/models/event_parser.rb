class EventParser

attr_accessor :blurb

GRAMMAR = {practice: /^\s?practice/i,
		   date: /^\s*\d+\s*[A-Za-z]+\s?.*:/,
		   yes: /^\s*yes:/i,
		   no: /^\s*no:/i,
		   dk: /^\s*dk:/i,
		   prob: /^\s*prob:/i,
		   booking: /^\s*booking(s)?:/i,
		   booking2: /^(\s*.+\,)(\s*.+\s+\d+)(.+\d+)?\./i,
		   dert: /^(\s*dert\s*)(\d{4})/i,
		   empty: /^\s*$/,
		   end_section: /^=+$/
		   }

def initialize
	@blurb = Blurb.find_by_name("Google Doc").
				content.gsub("\r\n\r\n", "\r\n").
				split("\r\n")
end

#helper to reduce typing
def reg(key)
	GRAMMAR[key]
end

def parse
	obj = nil
	flag = nil
	prev_line = nil
	@blurb.each_with_index do |line, i|
		next_line = @blurb[i+1] if (i < (@blurb.length - 1))
		
		puts line.inspect
				
		case line
		when reg(:practice)
			flag = :p
		when reg(:booking)
			flag = :b
	    when reg(:dert)
	    	obj.save if obj.present?
	    	obj = Booking.new
	    	obj.what = "DERT #{$~[1]}"
		when reg(:date)
			obj.save if obj.present? 
			obj = Booking.new if flag == :b
			obj = Practice.new if flag == :p
			obj.when = Date.parse($~[0])
			obj.where = $' if $'.present?
		when reg(:booking2)
			obj.save if obj.present? 
			if flag == :b
				obj = Booking.new 
				obj.what = $~[0].to_s
				obj.when = Date.parse($~[1])
		    else
			  next
		    end
		when reg(:yes)
			obj.yes = $'
			prev_line = 'yes'
		when reg(:no)
			obj.no = $'
			prev_line = 'no'
		when reg(:dk)
			obj.dk = $'
			prev_line = 'dk'
		when reg(:prob)
			obj.prob = $'
			prev_line = 'prob'
	    when reg(:empty)
	    	if prev_line.present?
	    		prev_line = nil
	    	end
	    when reg(:end_section)
	    	obj.save
	    	obj = nil
		else
	    	if prev_line.present? && prev_line.reverse[0] == ','
	    		curr = obj.send(prev_line)
	    	    obj.send(prev_line +"=", curr + line.strip)
	    	end
		end
		#debug code
		puts $~.inspect
		puts $'.inspect
		puts "---------"
	end
	obj.save if obj.new_record?
end

def coming_or_not?(line)
 Regex.union [reg(:yes), reg(:no),reg(:dk), reg(:prob)] =~ line
end




end