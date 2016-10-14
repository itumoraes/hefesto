# frozen_string_literal: true
class User < ApplicationRecord
  devise :cas_authenticatable, :trackable

  def gravatar_url
    require 'digest'

    md5 = Digest::MD5.new
    md5.update email
    "https://www.gravatar.com/avatar/#{md5.hexdigest}?s=40"
  end
end
