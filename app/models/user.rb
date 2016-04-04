class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  VALID_NAME_REGEX = /\A\D+/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 },
            format: { with: VALID_NAME_REGEX }
end
