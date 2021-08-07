require 'rails_helper' #pending "add some examples to (or delete) #{__FILE__}"

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'encrypted_passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', encrypted_password: '')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'last_nameが空では登録できない'
end
end