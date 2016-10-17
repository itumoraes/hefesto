# frozen_string_literal: true
require 'rails_helper'

describe HomeOffice, type: :model do
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:user) }
end
