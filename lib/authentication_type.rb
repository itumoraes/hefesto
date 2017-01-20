module AuthenticationType
  def self.included(klass)
    if cas?
      klass.devise :cas_authenticatable, :trackable
    else
      klass.devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    end
  end

  def self.cas?
    File.exist?('config/cas.yml')
  end
end
