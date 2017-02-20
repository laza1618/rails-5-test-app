module ApplicationHelper
  def flash_messages
    tags = []
    if flash.any?
      flash.each do |message_type, message|
        type = case message_type
          when "notice"
            "info"
          when "alert"
            "warning"
          else
            message_type
        end
        message_tag = content_tag(:div, class: "alert alert-#{type} alert-dismissible show") do
          concat(
            content_tag(:button, class: "close", :"data-dismiss" => "alert", :"aria-label" => "Close") do
              content_tag(:span, "&times;".html_safe, "aria-hidden" => true)
            end
          )
          concat(message)
        end
        tags << message_tag.html_safe
      end
    end
    return tags.join.html_safe
  end
end
