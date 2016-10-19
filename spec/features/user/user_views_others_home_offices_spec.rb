# frozen_string_literal: true
require 'rails_helper'

feature 'User views others home office on calendar', js: true do
  scenario 'on dashboard load' do
    user_a = create(:user)
    user_b = create(:user, username: 'johndoe', name: 'John Doe')
    create(:home_office, user: user_a, date: '2016-10-17')
    create(:home_office, user: user_b, date: '2016-10-19')

    login_as user_a
    visit root_path

    within '[data-date="2016-10-17"]' do
      name = find('img')[:alt]
      expect(name).to have_content(user_a.name)
    end

    within '[data-date="2016-10-19"]' do
      name = find('img')[:alt]
      expect(name).to have_content(user_b.name)
    end
  end
end
