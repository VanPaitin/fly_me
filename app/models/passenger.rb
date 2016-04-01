class Passenger < ActiveRecord::Base
  VALID_NAME_REGEX = /\A\D+/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A(\+)?(\s|\d|-)+\z/
  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, format: { with: VALID_PHONE_REGEX }
  belongs_to :booking
end
