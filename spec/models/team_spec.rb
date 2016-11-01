# frozen_string_literal: true
require 'rails_helper'

describe Team, type: :model do
  it { should validate_uniqueness_of(:name) }
end
