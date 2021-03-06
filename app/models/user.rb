class User < ApplicationRecord
  has_secure_password
  has_many :decks
  # has_many :decks, through: :favorite
  has_many :scores
  has_many :cards, through: :score

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.password = SecureRandom.urlsafe_base64
        user.save!
      end
    end
end
