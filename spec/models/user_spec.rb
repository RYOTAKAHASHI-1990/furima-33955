require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
   context '新規登録できるとき' do
    it 'nicknameとeamil、passwordとpassword_confirmation、名前と名前(カナ)、生年月日が共存すれば登録できる' do
      expect(@user).to be_valid
    end
   end
   context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthday_dateが空では登録できない' do
      @user.birthday_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday date can't be blank")
    end
    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = "sample.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが半角英字だけでは登録できないこと' do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが半角数字だけでは登録できないこと' do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '苗字が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.family_name = "abc123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it '氏名が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = "abc123"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it '苗字カナが全角カタカナ以外では登録できないこと' do
      @user.family_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it '氏名カナが全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
 end
end
