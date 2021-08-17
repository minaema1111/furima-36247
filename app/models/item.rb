class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image

  with_options presence: true do
    validates :description
    validates :name
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :scheduled_delivery_id
    validates :prefecture_id
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' },
                      numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
    validates :image
  end

  belongs_to :user
  #  has_one :purchase
  validates :category_id, :condition_id, :charge_id, :scheduled_delivery_id, :prefecture_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
