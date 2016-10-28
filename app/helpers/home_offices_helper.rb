# frozen_string_literal: true
module HomeOfficesHelper
  def current_user_home_office?(home_office)
    home_office.user == current_user
  end

  def home_office_css(home_office)
    if current_user_home_office?(home_office)
      'calendar-user calendar-user-ho'
    else
      'calendar-user'
    end
  end
end
