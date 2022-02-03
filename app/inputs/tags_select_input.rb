class TagsSelectInput < SimpleForm::Inputs::CollectionSelectInput

  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group') do
      template.concat @builder.select_field(attribute_name, input_html_options)
      template.concat classification_options
    end
  end

  def input_html_classes
    super.push('form-control')
  end

  def

  def input_html_options
    super.merge({"data-input"=>""})
  end

end
