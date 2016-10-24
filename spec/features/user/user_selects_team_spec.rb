# frozen_string_literal: true
require 'rails_helper'

feature 'User selects a team' do
  context 'when logs in for the first time' do
    scenario 'successfully' do
      team = create(:team)
      user = create(:user, team: nil)
      login_as user

      visit root_path

      expect(page).to have_content 'Você deve selecionar um time para marcar
                                    HOs. Selecione um abaixo ou crie um novo'
      within ".team_#{team.id}" do
        click_on 'Entrar para este time'
      end

      expect(page).to have_content 'Usuário atualizado com sucesso!'
      within '.ls-brand-name' do
        expect(page).to have_content team.name
      end
    end
  end
end
