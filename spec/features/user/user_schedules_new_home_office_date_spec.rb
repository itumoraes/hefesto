# frozen_string_literal: true
require 'rails_helper'

feature 'User schedules a new home office date', js: true do
  scenario 'successfully' do
    user = create(:user)
    login_as user

    visit root_path

    click_on 1.day.from_now.strftime('%Y-%m-%d')
    expect(page).to have_content 'Deseja marcar HO neste dia?'
    click_on 'Confirmar'

    expect(page).to have_content 'Home office marcado com sucesso!'
  end
end
