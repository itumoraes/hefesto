# frozen_string_literal: true
class Team < ApplicationRecord
  validates :name, uniqueness: true
  has_many :users
end
