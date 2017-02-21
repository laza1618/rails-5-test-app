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
        if message.is_a?(Array)
          message.each do |msg|
            message_tag = build_notif_tag(type, msg)
            tags << message_tag.html_safe
          end
        else
          tags << build_notif_tag(type, message)
        end
      end
    end
    return tags.join.html_safe
  end

  def build_notif_tag(type, message)
    content_tag(:div, class: "alert alert-#{type} alert-dismissible show fade") do
      concat(
        content_tag(:button, class: "close", :"data-dismiss" => "alert", :"aria-label" => "Close") do
          content_tag(:span, "&times;".html_safe, "aria-hidden" => true)
        end
      )
      concat(message)
    end
  end
end
