# frozen_string_literal: true
require 'rails_helper'

feature 'User authenticates' do
  scenario 'signs in' do
    user = create(:user)
    login_as(user)

    visit root_path

    expect(page).to have_content "#{user.name} (#{user.username})"
  end

  scenario 'signs out' do
    user = create(:user)
    login_as(user)
    visit root_path

    within('.ls-topbar') do
      click_on 'Sair'
    end

    expect(current_path).to include('/')
  end
end
