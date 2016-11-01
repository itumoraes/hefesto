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
    if @team.save
      flash.now[:success] = t('.success', team: @team.name)
    else
      flash.now[:error] = t('.error', team: @team.name)
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
