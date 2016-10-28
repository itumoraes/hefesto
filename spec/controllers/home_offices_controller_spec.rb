# frozen_string_literal: true
require 'rails_helper'

describe HomeOfficesController do
  describe 'POST #create' do
    context 'when date is valid' do
      it 'creates a new home office' do
        sign_in create(:user)

        expect do
          date = Time.zone.now.strftime('%Y-%m-%d')
          post :create, params: { home_office: { date: date } }
        end.to change { HomeOffice.count }.by(1)
        expect(flash[:success]).to match(/^Home office marcado com sucesso!/)
      end
    end

    context 'when date is invalid' do
      it 'returns a failure message' do
        sign_in create(:user)
        post :create, params: { home_office: { date: nil } }

        expect(flash[:error]).to match(/^Erro ao marcar Home office!/)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when user destroy your own home office' do
      it 'destroys scheduled home office' do
        user = create(:user)
        date = Time.zone.now.strftime('%Y-%m-%d')
        home_office = user.home_offices.create(date: date)
        sign_in user

        expect do
          delete :destroy, params: { id: home_office.id,
                                     date: Time.zone.now,
                                     user: user.id }
        end.to change { HomeOffice.count }.from(1).to(0)
      end
    end

    context 'when user try destroy an another user home office' do
      it 'do not destroy and show deny message' do
        user = create(:user)
        date = Time.zone.now.strftime('%Y-%m-%d')
        home_office = user.home_offices.create(date: date)
        sign_in create(:user)

        expect do
          delete :destroy, params: { id: home_office.id }
        end.not_to change { HomeOffice.count }

        expect(flash[:error])
          .to match(/Você não pode desmarcar esse Home office/)
      end
    end
  end
end
