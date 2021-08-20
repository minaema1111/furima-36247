class Purchase < ApplicationRecord
  attr_accessor :token
  belongs_to :user
belongs_to :item
has_one :residence
has_one_attached :image




# with_options presence: true do
# validates :user_id
# validates :item_id
# end
end
