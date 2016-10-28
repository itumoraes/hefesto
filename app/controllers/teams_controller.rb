# frozen_string_literal: true
class TeamsController < ApplicationController
  layout 'pre_panel'
  def index
    @teams = Team.all
  end
end
