# frozen_string_literal: true
class User < ApplicationRecord
  devise :cas_authenticatable, :trackable

  def cas_extra_attributes=(extra_attributes)
    self.name = extra_attributes['cn']
    self.user_type = extra_attributes['type']
    self.email = extra_attributes['email']
    self.user_privilegies = extra_attributes['authorities'].join(',')
  end

  def gravatar_url
    require 'digest'

    md5 = Digest::MD5.new
    md5.update email
    "https://www.gravatar.com/avatar/#{md5.hexdigest}?s=40"
  end
end
