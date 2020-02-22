require 'rails_helper'

RSpec.describe Station, type: :model do
  before do
    @station1 = FactoryBot.create(:station1)
    @station2 = FactoryBot.create(:station2)
    @station3 = FactoryBot.create(:station3)
  end
  it 'nameが空ならバリデーションが通らない' do
    station = Station.new(name: '', route: '失敗テスト')
    expect(station).not_to be_valid
  end

  it 'nameの文字数が21文字以上ならバリデーションが通らない' do
    station = Station.new(name: 'あ'* 21, route: '根岸線')
    expect(station).not_to be_valid
  end

  it 'routeが空ならバリデーションが通らない' do
    station = Station.new(name: '失敗テスト', route: '')
    expect(station).not_to be_valid
  end

  it 'routeの文字数が21文字以上ならバリデーションが通らない' do
    station = Station.new(name: '洋光台', route: 'a' *  21)
    expect(station).not_to be_valid
  end

  it '全ての内容が記載されていればバリデーションが通る' do
    station = Station.new(name: '根岸', route: '根岸線')
    expect(station).to be_valid
  end

  it '既に登録してある駅名を登録しようとするとバリデーションが通らない' do
    station = Station.new(name: '七里ヶ浜', route: '江ノ島電鉄')
    expect(station).not_to be_valid
  end



end
