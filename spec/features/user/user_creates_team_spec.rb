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

      fill_in 'team[name]', with: 'Dream team'

      click_on 'Salvar'

      expect(page).to have_content 'Dream team'
    end
  end
end
