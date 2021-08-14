require 'rails_helper' #pending "add some examples to (or delete) #{__FILE__}"

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが英語のみでは登録できないこと' do
    @user.password = 'abcdef'
    @user.password_confirmation = 'abcdef'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = 123456
      @user.password_confirmation = 123456
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが全角では登録できない' do
      @user.password = '１２３abc'
      @user.password_confirmation = '１２３abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'emailは＠が無いと保存できないこと' do
      @user.email = 'email_pass'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailが存在する場合登録できないこと' do
      FactoryBot.create(:user, email: "test@mail.com")
      user = FactoryBot.build(:user, email: "test@mail.com")
      user.valid?
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
    it 'first_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'ichige'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.last_name = 'tomohiro'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = '智浩'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'last_name_kanaは全角カタカナ以外では登録できないこと' do
      @user.last_name_kana = '市毛'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
  end
  context '新規登録できるとき' do
    it '全て入力されている時登録できる' do
      expect(@user).to be_valid
    end
  end
end
end
end
end