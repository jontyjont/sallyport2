module ApplicationHelper

def form_fields(form, label, value)
out=""
out << "<div class='form-group width-maxed'>
<label>#{label}</label>
#{form.text_field value, :class => 'form-control '}
</div>"
out.html_safe
end

end
