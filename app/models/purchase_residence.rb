class PurchaseResidence
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :house_number
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, format: { with: VALID_PHONE_REGEX, message:"Input only number" }
  end
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Enter it as follows (e.g. 123-4567)"},allow_blank: true


    def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      residence = Residence.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number )
    end
end
