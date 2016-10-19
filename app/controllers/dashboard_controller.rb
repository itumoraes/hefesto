# frozen_string_literal: true
class DashboardController < ApplicationController
  def show
    @home_office = HomeOffice.new
    @home_offices = HomeOffice.current_month
  end
end
