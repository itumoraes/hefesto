# frozen_string_literal: true
require 'rails_helper'

describe HomeOfficesController do
  describe 'POST #create' do
    context 'when date is valid' do
      it 'creates a new home office' do
        sign_in create(:user)

        expect do
          date = Time.zone.now.strftime('%Y-%m-%d')
          post :create, home_office: { date: date }
        end.to change { HomeOffice.count }.by(1)
        expect(flash[:success]).to match(/^Home office marcado com sucesso!/)
      end
    end

    context 'when date is invalid' do
      it 'returns a failure message' do
        sign_in create(:user)
        post :create, home_office: { date: nil }

        expect(flash[:error]).to match(/^Erro ao marcar Home office!/)
      end
    end
  end
end
