# frozen_string_literal: true
class DashboardController < ApplicationController
  def show
    @home_office = HomeOffice.new
  end
end
