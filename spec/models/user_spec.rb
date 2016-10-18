# frozen_string_literal: true
require 'rails_helper'

describe User do
  describe '#gravatar_url' do
    it 'returns the user gravatar image' do
      gravatar_url = 'https://www.gravatar.com/avatar/f25fd40de4337a360c90428fcade8b67?s=40'
      user = create(:user, email: 'itu.moraes@gmail.com')

      expect(user.gravatar_url).to eq(gravatar_url)
    end
  end

  describe '#cas_extra_attributes' do
    it 'maps the attributes from cas to user model' do
      extra_attributes = {
        'authorities' => ['Hg-Freddie'],
        'cn' => 'Jane Doe',
        'email' => 'jane.doe@locaweb.com.br',
        'type' => 'Employee'
      }
      user = build(:user, cas_extra_attributes: extra_attributes)

      expect(user.name).to eq(extra_attributes['cn'])
      expect(user.email).to eq(extra_attributes['email'])
      expect(user.user_type).to eq(extra_attributes['type'])
      expect(user.user_privilegies)
        .to eq(extra_attributes['authorities'].join(','))
    end
  end
end
