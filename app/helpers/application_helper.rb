module ApplicationHelper

def form_fields(form, label, value)
out=""
out << "<div class='form-group width-maxed'>
<label>#{label}</label>
#{form.text_field value, :class => 'form-control '}
</div>"
out.html_safe
end

def next_practice(p)
  "Next Practice: #{p.when.to_s(:short)} at #{link_to 'The Sun Inn, Swallwell', "https://www.google.co.uk/maps/place/Sun+Inn,+Market+Ln,+Swalwell,+Newcastle+upon+Tyne,+Tyne+and+Wear+NE16+3AL/@54.9546626,-1.6857987,17z/", :target => '_BLANK'}, 8p.m. ".html_safe
end

end
