# frozen_string_literal: true
class HomeOffice < ApplicationRecord
  validates :date, :user, :team, presence: true
  belongs_to :user
  belongs_to :team

  def self.current_period_for(team)
    where(date: (40.days.ago..40.days.from_now), team: team)
  end
end
