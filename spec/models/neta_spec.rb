require 'rails_helper'

RSpec.describe Neta, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'contentが空ならバリデーションが通らない' do
    neta = Neta.new(user_id: @user.id, content: '')
    expect(neta).not_to be_valid
  end

  it 'contentの文字数が51文字以上ならバリデーションが通らない' do
    neta1 = Neta.new(user_id: @user.id, content: 'あ'* 51)
    expect(neta1).not_to be_valid
  end

  it 'contentさえ記載されていればバリデーションが通る' do
    neta2 = Neta.new(user_id: @user.id, content: 'あ')
    expect(neta2).to be_valid
  end



end
