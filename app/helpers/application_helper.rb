module ApplicationHelper

def form_fields(form, label, value)
out=""
out << "<div class='form-group'>
<label class='col-sm-2 control-label'>#{label}</label>
#{form.text_field value, :class => 'col-sm-8'}
</div>"
out.html_safe
end

end
