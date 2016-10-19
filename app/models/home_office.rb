# frozen_string_literal: true
class HomeOffice < ApplicationRecord
  validates :date, :user, presence: true
  belongs_to :user
  scope :current_month, -> { where(date: (20.days.ago..20.days.from_now)) }
end
