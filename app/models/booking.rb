class Booking < ActiveRecord::Base
  belongs_to :flight
  belongs_to :user
  has_many :passengers
  validates_associated :passengers
  accepts_nested_attributes_for :passengers, reject_if: :all_blank,
                                 allow_destroy: true
  validates :flight_id, presence: true
end
