class Residence < ApplicationRecord
  belongs_to :purchase

  # with_options presence: true do
  # validates :purchase, foreign_key: true
  # validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
  # validates :prefecture_id, numericality: {other_than: 0 }
  # validates :municipalities
  # validates :house_number
  # VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  # validates :phone_number, format: { with: VALID_PHONE_REGEX }
  # end
  # validates :building_name
end