module ApplicationHelper

def form_fields(form, label, value)
out=""
out << "<div class='control-group'>
<label class='control-label'>#{label}</label>
<div class='controls'>
#{form.text_field value}
</div>
</div>"
out.html_safe
end

end
