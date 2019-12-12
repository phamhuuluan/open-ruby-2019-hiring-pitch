class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.users.email.email_regex

  before_save :downcase_email

  has_many :pitch_owners
  has_many :user_pitch_reactions, as: :user_pitch_reactionable
  has_one :profile_user, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader

  validates :fullname, presence: true, length: {maximum: Settings.users.name.max_length}
  validates :email, presence: true, length: {maximum: Settings.users.email.max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum:  Settings.users.password.max_length}, allow_nil: true
  validate  :avatar_size

  has_secure_password
  
  USER_PARAMS = %i(fullname email password password_confirmation).freeze
  USER_UPDATE_PARAMS = %i(fullname email password password_confirmation address phone avatar).freeze
 
  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
  
  private

  def downcase_email
    email.downcase!
  end

  def avatar_size
    return unless avatar.size > Settings.users.avatar_size.size.megabytes
    errors.add(:avatar, t(".errors"))
  end
end
