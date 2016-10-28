# frozen_string_literal: true
require 'rails_helper'

feature 'User schedules a new home office date', js: true do
  let(:date) { Date.new(2016, 10, 19) }
  before { Timecop.freeze(date) }

  scenario 'successfully' do
    user = create(:user)

    login_as user
    visit root_path

    find('[data-td-date="2016-10-19"]').hover
    find('[data-date="2016-10-19"]').click
    click_on 'Confirmar'

    expect(page).to have_content 'Home office marcado com sucesso!'
    within '[data-td-date="2016-10-19"]' do
      name = find('span')[:title]
      expect(name).to have_content(user.name)
    end
  end
end
