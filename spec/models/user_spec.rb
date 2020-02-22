require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
  end
  it 'nameが空ならバリデーションが通らない' do
    user= User.new(name: '', email: '11@gmail.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it 'nameの文字数が21文字以上ならバリデーションが通らない' do
    user= User.new(name: 'あ'* 21, email: '11@gmail.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it 'nameが既に存在しているものを登録するとバリデーションが通らない' do
    user= User.new(name: 'admin_user', email: '11@gmail.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it 'emailが期待されてない文字列ならバリデーションが通らない' do
    user= User.new(name: 'あ', email: '失敗テスト', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it 'emailの文字数が256文字以上ならバリデーションが通らない' do
    user= User.new(name: 'yoshimitsu', email: 'a'* 247 + '@gmail.com', password: 'password', password_confirmation: 'password')
    expect(user).not_to be_valid
  end

  it 'profileの文字数が201文字以上ならバリデーションが通らない' do
    user= User.new(name: 'yoshimitsu', email: '201@gmail.com', password: 'password', password_confirmation: 'password', profile: 'p' * 201)
    expect(user).not_to be_valid
  end

  it '全ての内容がバリデーションに引っかからず問題なく記載されていればバリデーションが通る' do
    user= User.new(name: 'yoshimitsu', email: 'yoshimitsu@gmail.com', password: 'password', password_confirmation: 'password')
    expect(user).to be_valid
  end

end
