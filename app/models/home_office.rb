# frozen_string_literal: true
class HomeOffice < ApplicationRecord
  validates :date, :user, presence: true
  belongs_to :user
  scope :current_period, -> { where(date: (40.days.ago..40.days.from_now)) }
end
