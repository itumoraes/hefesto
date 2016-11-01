# frozen_string_literal: true
require 'rails_helper'

feature 'User creates a team' do
  context 'when logs in for the first time' do
    scenario 'successfully', js: true do
      user = create(:user, team: nil)
      login_as user

      visit root_path

      expect(page).to have_content 'Você deve selecionar um time para marcar
                                    HOs. Selecione um abaixo ou crie um novo'

      click_on 'Adicionar novo time'

      fill_in 'team[name]', with: 'Dream Team'

      click_on 'Salvar'

      expect(page).to have_content 'Dream Team'
    end
  end

  context 'with a name of an existing team' do
    scenario 'unsuccessfully', js: true do
      create(:team, name: 'Dream Team')
      user = create(:user, team: nil)
      login_as user

      visit root_path

      click_on 'Adicionar novo time'

      fill_in 'team[name]', with: 'Dream Team'

      click_on 'Salvar'

      expect(page).to have_content 'O nome Dream Team já foi utilizado,
                                    por favor escolha outro.'
      within '#teams-list' do
        expect(page).to have_content('Dream Team', count: 1)
      end
    end
  end
end
