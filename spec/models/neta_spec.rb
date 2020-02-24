require 'rails_helper'

RSpec.describe Neta, type: :model do

  it 'contentが空ならバリデーションが通らない' do
    neta = Neta.new(content: '')
    expect(neta).not_to be_valid
  end

  it 'contentの文字数が51文字以上ならバリデーションが通らない' do
    neta = Neta.new(content: 'あ'* 51)
    expect(neta).not_to be_valid
  end



  it 'contentさえ記載されていればバリデーションが通る' do
    neta = Neta.new(content: 'あ')
    expect(neta).to be_valid
  end



end
