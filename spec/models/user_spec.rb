# frozen_string_literal: true
require 'rails_helper'

describe User do
  describe '#gravatar_url' do
    it 'returns the user gravaar image' do
      gravatar_url = 'https://www.gravatar.com/avatar/f25fd40de4337a360c90428fcade8b67?s=40'
      user = create(:user, email: 'itu.moraes@gmail.com')

      expect(user.gravatar_url).to eq(gravatar_url)
    end
  end
end
