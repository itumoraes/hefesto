# frozen_string_literal: true
FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "Hefesto Team #{n}" }
  end
end
