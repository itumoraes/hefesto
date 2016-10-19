# frozen_string_literal: true
class DashboardController < ApplicationController
  def show
    @home_office = HomeOffice.new
    @home_offices = HomeOffice.where(date: (20.days.ago..20.days.from_now))
  end
end
