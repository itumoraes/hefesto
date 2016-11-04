# frozen_string_literal: true
require 'rails_helper'

feature 'User sees dashboard' do
  before { Timecop.freeze(Date.new(2016, 11, 0o3)) }

  context 'when there are other users on the same team' do
    scenario 'the user sees all of the team\'s home offices' do
      team = create(:team)
      user_b = create(:user, team: team, username: 'johndoe', name: 'John Doe')
      create(:home_office, user: user_b, team: team, date: '2016-11-04')

      login_as create(:user, team: team)
      visit root_path

      within '[data-td-date="2016-11-04"]' do
        name = find('span')[:title]
        expect(name).to have_content(user_b.name)
      end
    end
  end

  context 'when there are other users on a different team' do
    scenario 'the user does not see a different team\'s home offices' do
      dream_team = create(:team, name: 'Dream Team')
      space_jam_team = create(:team, name: 'Space Jam Team')
      bugs_bunny = create(:user, team: space_jam_team, name: 'Bugs Bunny')
      create(:home_office, user: bugs_bunny,
                           team: space_jam_team,
                           date: Date.new(2016, 11, 0o4))

      login_as create(:user, name: 'Michael Jordan', team: dream_team)
      visit root_path

      within '[data-td-date="2016-11-04"]' do
        expect(page).to_not have_selector('.calendar-user')
      end
    end
  end
end
