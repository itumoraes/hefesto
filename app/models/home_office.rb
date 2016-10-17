# frozen_string_literal: true
class HomeOffice < ApplicationRecord
  validates :date, :user, presence: true
  belongs_to :user
end
