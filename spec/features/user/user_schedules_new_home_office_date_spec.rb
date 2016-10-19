# frozen_string_literal: true
require 'rails_helper'

feature 'User schedules a new home office date', js: true do
  let(:date) { Date.new(2016,10,19) }
  before { Timecop.freeze(date) }

  scenario 'successfully' do
    user = create(:user)
    login_as user

    visit root_path

    find('[data-date="2016-10-19"]').click
    expect(page).to have_content 'Deseja marcar HO neste dia?'
    click_on 'Confirmar'

    expect(page).to have_content 'Home office marcado com sucesso!'
    within '[data-date="2016-10-19"]' do
      name = find('img')[:alt]
      expect(name).to have_content(user.name)
    end
  end
end
