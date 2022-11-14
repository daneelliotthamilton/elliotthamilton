module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success" # Green
      when "error"
        "alert-danger" # Red
      when "alert"
        "alert-warning" # Yellow
      when "notice"
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end

  def icon(style, name, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "#{style} fa-#{name}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    html << ' ' << text.to_s unless text.blank?
    html
  end

  def short_date(date)
		date.strftime("%B %e, %Y") if date
	end

  def formatted_time(time)
		if time.blank?
			"No date assigned"
		else
			if time.to_date == Date.today
				"Today at #{time.strftime('%I:%M%P')}"
			elsif time.to_date == Date.yesterday
				"Yesterday at #{time.strftime('%I:%M%P')}"
			elsif time.to_date == Date.tomorrow
				"Tomorrow at #{time.strftime('%I:%M%P')}"
			else
				"#{time.strftime('%B %d, %Y at %I:%M%P')}"
			end
		end
	end
  
end
