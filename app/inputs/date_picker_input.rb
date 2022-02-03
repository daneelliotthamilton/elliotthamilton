class DatePickerInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group datepicker') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_remove
      template.concat span_table
    end
  end

  def input_html_classes
    super.push('form-control')
  end

  def input_html_options
    super.merge({"data-input"=>""})
  end


  def span_remove
    template.content_tag(:span, class: 'input-group-text', "data-clear"=>"") do
      "<i class='fas fa-calendar-times'></i>".html_safe
    end
  end

  def span_table
    template.content_tag(:span, class: 'input-group-text', "data-toggle"=>"") do
      "<i class='fas fa-calendar-alt'></i>".html_safe
    end
  end
end
