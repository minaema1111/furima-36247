class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image

         validates :description, presence: true
         validates :name, presence: true
         validates :category_id, presence: true
         validates :condition_id, presence: true
         validates :charge_id, presence: true
         validates :scheduled_delivery_id, presence: true
         validates :prefecture_id, presence: true
         validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
         validates :image, presence: true
         belongs_to :user
        #  has_one :purchase
         validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

end