# frozen_string_literal: true
require 'rails_helper'

describe UsersHelper, type: :helper do
  describe '#home_office_at_date?' do
    let(:user) { create(:user) }
    let(:date) { Date.new(2016, 10, 28) }
    let!(:home_office) { create(:home_office, user: user, date: date) }

    before { allow(helper).to receive(:current_user).and_return(user) }

    it 'returns if the user have home office at the choosed date' do
      expect(helper.home_office_at_date?(date)).to be true
    end
  end
end
