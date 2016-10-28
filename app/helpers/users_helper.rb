# frozen_string_literal: true
module UsersHelper
  def home_office_at_date?(date)
    current_user.home_offices.where(date: date).present?
  end
end
