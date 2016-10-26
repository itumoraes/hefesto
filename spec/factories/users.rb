# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    name 'Italo Moraes'
    sequence(:username) { |n| "itumoraes#{n}" }
    sequence(:email) { |n| "#{username}#{n}@mail.com" }
    encrypted_password 'inicial1234'
    team
  end
end
