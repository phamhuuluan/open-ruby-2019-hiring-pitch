class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.users.email.email_regex

  has_many :pitch_owners
  has_many :user_pitch_reactions, as: :user_pitch_reactionable

  validates :name, presence: true, length: {maximum: Settings.users.name.max_length}
  validates :email, presence: true, length: {maximum: Settings.users.email.max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum:  Settings.users.password.max_length}, allow_nil: true
  has_secure_password
  
end
