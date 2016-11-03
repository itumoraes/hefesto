# frozen_string_literal: true
require 'rails_helper'

describe HomeOffice, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:team) }

  describe '.current_period_for' do
    it 'returns the team\'s home office in the current month' do
      user = create(:user)
      date = Time.zone.now.strftime('%Y-%m-%d')
      team_ho = create(:home_office, date: date, team: user.team)
      other_team_ho = create(:home_office, date: date)

      expect(HomeOffice.current_period_for(user.team)).to include(team_ho)
      expect(HomeOffice.current_period_for(user.team))
        .to_not include(other_team_ho)
    end
  end
end
