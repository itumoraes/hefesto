# frozen_string_literal: true
class TeamsController < ApplicationController
  layout 'pre_panel'

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.save
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
