require 'rails_helper'
RSpec.describe 'ネタ管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @neta = FactoryBot.create(:neta, user: @user)
    @neta1 = FactoryBot.create(:neta1, user: @user)
    @neta2 = FactoryBot.create(:neta2, user: @user1)
    @neta3 = FactoryBot.create(:neta3, user: @user2)
    FactoryBot.create(:station)
    FactoryBot.create(:station1)
    FactoryBot.create(:station2)
    FactoryBot.create(:station3)
    FactoryBot.create(:favorite, user_id: @user.id, neta_id: @neta.id)
    FactoryBot.create(:favorite, user_id: @user.id, neta_id: @neta1.id)
    FactoryBot.create(:favorite, user_id: @user1.id, neta_id: @neta.id)
    visit new_user_session_path
    fill_in "メールアドレス", with: "1@gmail.com"
    fill_in "パスワード", with: "password"
    click_button "Log in"
  end

  describe 'ネタ一覧画面' do
    context 'ネタを作成した場合' do
      it '作成済みのネタが表示されること' do
      visit new_neta_path
      fill_in 'neta_content', with: '洋光台'
      attach_file '写真', "#{Rails.root}/spec/images/zwz_AAQj.png"
      click_button '登録する'
      click_button '投稿する'
      expect(page).to have_content '洋光台'
      expect(page).to have_selector("img[src$='zwz_AAQj.png']")
    end
  end

  context 'ネタを編集した場合' do
    it '編集済みのネタが表示されること' do
    visit netas_path
    click_link 'ネタを編集する', match: :first
    page.driver.browser.switch_to.alert.accept
    fill_in 'neta_content', with: '根岸線'
    click_button '更新する'
    expect(page).to have_content '根岸線'
  end
end


    context '複数のネタを作成した場合' do
      it 'ネタが作成日時の降順に並んでいること' do
        visit new_neta_path
        fill_in 'neta_content', with: 'yoshitaka2'
        click_button '登録する'
        click_button '投稿する'
        visit new_neta_path
        fill_in 'neta_content', with: 'yoshitaka1'
        click_button '登録する'
        click_button '投稿する'
        expect(page).to have_text /.*yoshitaka1.*yoshitaka2.*/m
      end
    end

    context 'お気に入りの数順に並べた場合' do
      it 'お気に入りの順に並んでいること' do
        visit netas_path
        click_link 'お気に入りの数順で並び替える'
        expect(page).to have_text /.*neta.*neta1.*/m
      end
    end

    context 'ネタを削除した場合' do
      it '削除したネタが一覧画面から消去される' do
        click_link 'ネタを削除する', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_text 'yoshitaka2'
      end
    end
  end

  describe 'ネタ詳細画面' do
     context '任意のネタ詳細画面に遷移した場合' do
       it '該当ネタの内容が表示されたページに遷移すること' do
         visit new_neta_path
         fill_in 'neta_content', with: 'youkoudai'
         check "洋光台"
         click_button '登録する'
         click_button '投稿する'
         click_link '詳細を確認する', match: :first
         expect(page).to have_content '内容：youkoudai'
         expect(page).to have_content 'ネタ元の駅: 洋光台'
       end
     end

     context 'お気に入り機能' do
       it 'お気に入りボタンを押すとその通知がされ自分のお気に入りページにも登録される' do
         visit new_neta_path
         fill_in 'neta_content', with: 'youkoudai'
         click_button '登録する'
         click_button '投稿する'
         click_link '詳細を確認する', match: :first
         click_link "お気に入りする"
         expect(page).to have_content 'お気に入り登録しました'
         click_link 'プロフィール'
         click_link 'お気に入りを見る'
         expect(page).to have_content 'youkoudai'
       end
       it 'お気に入り解除ボタンを押すとその通知がされ自分のお気に入りページにも反映される' do
         visit new_neta_path
         fill_in 'neta_content', with: 'youkoudai'
         click_button '登録する'
         click_button '投稿する'
         click_link '詳細を確認する', match: :first
         click_link "お気に入りする"
         expect(page).to have_content 'お気に入り登録しました'
         click_link '詳細を確認する', match: :first
         click_link "お気に入り解除する"
         expect(page).to have_content 'お気に入り解除しました'
         click_link 'プロフィール'
         click_link 'お気に入りを見る'
         expect(page).not_to have_content 'youkoudai'
       end
     end

     context 'コメント機能' do
       it 'コメントを作成した場合コメントが表示される' do
         visit netas_path
         click_link '詳細を確認する', match: :first
         fill_in('comment_content', with: 'youkoudai')
         click_button 'Comment'
         expect(page).to have_content 'コメントが投稿されました'
         expect(page).to have_content 'youkoudai'
       end

       it 'コメントが編集できる' do
         visit netas_path
         click_link '詳細を確認する', match: :first
         fill_in('comment_content', with: 'hongoudai')
         click_button 'Comment'
         click_link 'Edit'
         fill_in('comment_edit', with: 'hongoudai')
         click_button '送信'
         expect(page).to have_content 'コメントが編集されました'
         expect(page).to have_content 'hongoudai'
       end

       it 'コメントが削除できる' do
         visit netas_path
         click_link '詳細を確認する', match: :first
         fill_in('comment_content', with: 'youkoudai')
         click_button 'Comment'
         click_link 'Delete'
         page.driver.browser.switch_to.alert.accept
         expect(page).to have_content 'コメントが削除されました'
         expect(page).not_to have_content 'youkoudai'
       end

     end

  end

  describe 'ransackによる検索機能のテスト' do
     context '駅（ラベル）を付与したネタを作成し' do
       it '該当ネタの詳細ページに遷移するとラベルの内容が記述されている' do
         visit new_neta_path
         fill_in 'neta_content', with: '1'
         check '洋光台'
         click_button '登録する'
         click_button '投稿する'
         visit new_neta_path
         fill_in 'neta_content', with: 'isogomade'
         check '磯子'
         click_button '登録する'
         click_button '投稿する'
         check '洋光台'
         click_button '検索'
         expect(page).to have_content '洋光台'
         expect(page).not_to have_content "isogomade"
       end
     end

   end

  end
