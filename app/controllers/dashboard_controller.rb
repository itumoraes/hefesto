# frozen_string_literal: true
class DashboardController < ApplicationController
  before_action :request_team

  def show
    @home_office = HomeOffice.new
    @home_offices = HomeOffice.current_period_for(current_user.team)
  end

  private

  def request_team
    return if current_user.team.present?
    flash[:alert] = I18n.t('.teams.select_team')
    redirect_to teams_path
  end
end
