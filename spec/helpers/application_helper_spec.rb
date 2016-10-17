# frozen_string_literal: true
require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe '#locastyle_class_for_alert' do
    it 'should returns danger when flash message is error' do
      expect(helper.locastyle_class_for_alert('error')).to eq('ls-alert-danger')
    end
    it 'should returns warning when flash message is alert' do
      expect(helper.locastyle_class_for_alert('alert'))
        .to eq('ls-alert-warning')
    end
    it 'should returns info when flash message is notice' do
      expect(helper.locastyle_class_for_alert('notice')).to eq('ls-alert-info')
    end
  end
end
