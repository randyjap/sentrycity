class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_many :stores, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :bookmarks, inverse_of: :user

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    existing_user = User.find_by(email: auth.info.email)
    if existing_user && existing_user.uid.nil?
      existing_user.tap do |user |
        user.update(
          provider: auth.provider,
          uid: auth.uid,
          name: auth.info.name,
          image: auth.info.image
        )
      end
    else
      find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.image = auth.info.image
      end
    end
  end
end
