# frozen_string_literal: true
class User < ApplicationRecord
  devise :cas_authenticatable, :trackable
  has_many :home_offices
  belongs_to :team, optional: true

  def cas_extra_attributes=(extra_attributes)
    self.name = extra_attributes['cn']
    self.user_type = extra_attributes['type']
    self.email = extra_attributes['email']
    if extra_attributes['authorities'].is_a?(Array)
      self.user_privilegies = extra_attributes['authorities'].join(',')
    else
      self.user_privilegies = extra_attributes['authorities']
    end
  end

  def gravatar_url
    require 'digest'

    md5 = Digest::MD5.new
    md5.update email
    "https://www.gravatar.com/avatar/#{md5.hexdigest}?s=40"
  end
end
