class User < ApplicationRecord
  EMAIL_VALIDATE_REGEX = Settings.email_validate_regex

  before_save{email.downcase!}

  validates :name, presence: true,
    length: {maximum: Settings.USER_NAME_MAX_LENGTH}
  validates :email, presence: true,
    length: {maximum: Settings.USER_EMAIL_MAX_LENGTH},
    format: {with: EMAIL_VALIDATE_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.USER_PASSWORD_MIN_LENGTH}

  has_secure_password
end
