class PracticeParser
  attr_accessor :blurb

	GRAMMAR = {
			   date: /^\s*\d+\s*[A-Za-z]+\s?.*:/,
			   yes: /^\s*yes:/i,
			   no: /^\s*no:/i,
			   dk: /^\s*dk:/i,
			   prob: /^\s*prob:/i,
			   empty: /^\s*$/,
			   end_section: /^=+$/
			   }
			   
  def initialize
	@blurb = Blurb.where(:name =>"practices").first
	@blurb.content.gsub("\r\n\r\n", "\r\n").split("\r\n") if @blurb
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
		
		when reg(:date)
			obj.save if obj.present? 			
			obj = Practice.new
			obj.when = Date.parse($~[0])
			obj.where = $' if $'.present?
			pexist = Practice.where(:when => obj.when).first
			pexist.destroy if pexist
		
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
