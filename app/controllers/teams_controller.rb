# frozen_string_literal: true
class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
end
