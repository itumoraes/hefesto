# frozen_string_literal: true
require 'rails_helper'

describe HomeOfficesHelper, type: :helper do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let!(:home_office) { create(:home_office, user: user) }
  let!(:another_home_office) { create(:home_office, user: another_user) }

  describe '#current_user_home_office?' do
    before { allow(helper).to receive(:current_user).and_return(user) }

    it 'returns if the home office belongs to the current user' do
      expect(helper.current_user_home_office?(home_office)).to be true
      expect(helper.current_user_home_office?(another_home_office)).to be false
    end
  end

  describe '#home_office_css' do
    before { allow(helper).to receive(:current_user).and_return(user) }

    it 'returns the home office css classes' do
      expect(helper.home_office_css(home_office)).to eq 'calendar-user '\
        'calendar-user-ho'
      expect(helper.home_office_css(another_home_office)).to eq 'calendar-user'
    end
  end
end
