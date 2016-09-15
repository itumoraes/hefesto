# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    name 'Rodrigo Liviero'
    username 'rodox'
    sequence(:email) { |n| "#{username}#{n}@mail.com" }
    encrypted_password 'inicial1234'
  end
end
