require 'rails_helper'
RSpec.describe '駅登録機能', type: :system do
  before do
    @station = FactoryBot.create(:station)
    @station1 = FactoryBot.create(:station1)

  end
  describe '駅一覧画面' do
    context '駅を登録した場合' do
      it '作成済みの駅が表示されること' do
        visit new_station_path
        fill_in 'station_name', with: '新杉田'
        fill_in 'station_route', with: '根岸線'
        click_button '登録する'
        expect(page).to have_content '新杉田'
        expect(page).to have_content '根岸線'
      end
    end

    context '駅を編集した場合' do
      it '編集済みの駅が表示されること' do
        visit stations_path
        click_link '駅を編集する', match: :first
        fill_in 'station_name', with: '山手'
        fill_in 'station_route', with: '根岸線'
        click_button '更新する'
        expect(page).to have_content '山手'
        expect(page).to have_content '根岸線'
      end
    end

    context '路線が根岸線の駅のレコードが１以下の場合だと編集や削除を行うと' do
      it 'ロールバックが起こり編者や削除ができない' do
        visit stations_path
        click_link '駅を削除する', match: :first
        click_link '駅を削除する'
        expect(page).to have_content '根岸線は不滅です'
        click_link '駅を編集する'
        fill_in 'station_name', with: 'hoge'
        fill_in 'station_route', with: 'hoge'
        click_button '更新する'
        expect(page).to have_text /.*駅を編集する.*/m
      end
    end

  end


 end
