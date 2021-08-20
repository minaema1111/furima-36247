require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  before do
    @purchase_residence = FactoryBot.build(:purchase_residence)
end

context '内容に問題ない場合' do
  it 'tokenがあれば保存ができること' do
    binding.pry
    expect(@purchase_residence).to be_valid
  end
end
end