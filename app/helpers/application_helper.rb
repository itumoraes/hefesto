# frozen_string_literal: true
module ApplicationHelper
  def locastyle_class_for_alert(flash_type)
    message = { error: 'danger', alert: 'warning', notice: 'info' }
    'ls-alert-' + (message[flash_type.to_sym] || flash_type.to_s)
  end
end
