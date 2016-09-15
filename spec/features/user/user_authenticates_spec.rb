# frozen_string_literal: true
require 'rails_helper'

feature 'User authenticates' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)

    visit root_path

    expect(page).to have_content "#{user.name} (#{user.username})"
  end
end
