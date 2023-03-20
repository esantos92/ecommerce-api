class Coupon < ApplicationRecord
  include Paginatable

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :discount_value, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :due_date, presence: true, future_date: true

  enum status: { active: 1, inactive: 2 }
end
