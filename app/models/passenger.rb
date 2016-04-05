class Passenger < ActiveRecord::Base
  before_save { self.email = email.downcase }
  belongs_to :booking
  VALID_NAME_REGEX = /\A[a-zA-Z]+(\-|\s)?[a-zA-Z]+(\-|\s)?[a-zA-Z]+(\-|\s)?[a-zA-Z]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A(\+)?(\s|\d|-)+\z/
  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, format: { with: VALID_PHONE_REGEX }
end
