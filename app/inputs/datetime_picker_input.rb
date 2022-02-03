class DatetimePickerInput < DatePickerInput

  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group datetimepicker') do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_remove
      template.concat span_table
    end
  end

  private

  def display_pattern
    I18n.t('datepicker.dformat', default: '%d/%m/%Y') + ' ' +
        I18n.t('timepicker.dformat', default: '%R')
  end

  def picker_pattern
    I18n.t('datepicker.pformat', default: 'DD/MM/YYYY') + ' ' +
        I18n.t('timepicker.pformat', default: 'HH:mm')
  end
end
