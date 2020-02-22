require 'rails_helper'

RSpec.describe 'ログイン機能、ユーザー管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user1 = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    FactoryBot.create(:neta, user: @user)
    FactoryBot.create(:neta1, user: @user)
    FactoryBot.create(:neta2, user: @user1)
    FactoryBot.create(:neta3, user: @user1)
    FactoryBot.create(:station)
    FactoryBot.create(:station1)
    FactoryBot.create(:station2)
    FactoryBot.create(:station3)
    visit new_user_session_path
    fill_in "メールアドレス", with: "1@gmail.com"
    fill_in "パスワード", with: "password"
    click_button "Log in"
  end

  describe 'ログイン/ログアウト機能のテスト' do
    context "新しいユーザーでサインアップすると" do
      it "　同時にログインできてデフォルトでは一般ユーザとなっている" do
        click_link 'ログアウト'
        visit new_user_registration_path
        fill_in 'user_name', with: "yoshitaka"
        fill_in 'user_email', with: "5@gmail.com"
        fill_in 'user_password', with: "password"
        fill_in 'user_password_confirmation', with: "password"
        click_button "Sign up"
        expect(page).to have_content 'アカウント登録が完了しました。'
        expect(page).to have_content 'ログアウト'
        click_link 'プロフィール'
        expect(page).to have_content 'あなたは一般ユーザーです'
    end
 end

    context 'ユーザーの編集ページで駅やプロフィールを更新すると' do
      it '登録された駅の詳細ページと自分のプロフィール画面が更新される' do
        click_link 'プロフィール'
        click_link 'プロフィールを編集する'
        fill_in 'user_profile', with: '浜っこです'
        fill_in 'user_current_password', with: "password"
        check "洋光台"
        click_button "Update"
        click_link 'プロフィール'
        expect(page).to have_content '浜っこです'
        expect(page).to have_content "洋光台"
        click_link 'Tops'
        click_link '詳細を確認する', match: :first
        expect(page).to have_text "admin_user"
      end
    end

    context 'ログアウトの状態でネタ作成のページに遷移しようとすると' do
      it 'ログインページに遷移する' do
        click_link 'ログアウト'
        visit new_neta_path
        expect(page).to have_text "アカウント登録もしくはログインしてください。"
        expect(page).to have_text /.*メールアドレス.*パスワード.*/m
      end
    end

  end

    describe 'アドミン機能のテスト' do
      context "管理者権限を持ったユーザーがプロフィールのページに遷移すると" do
        it "管理者ページに遷移できるリンクが確認されそこから遷移できる" do
          click_link 'プロフィール'
          click_link '管理画面に遷移する'
          expect(page).to have_text "サイト管理"
        end
      end
    context "管理者権限を持ったユーザーが新規ユーザーを作成すると" do
      it "作成されたユーザーが表示される" do

      end
    end

  context "管理者権限を持ったユーザーが新規ユーザーを削除すると" do
    it "削除されたユーザーが表示されなくなる" do

    end
  end

context "管理者権限を持ったユーザーが他ユーザーを編集すると" do
  it "編集されたユーザーが表示される" do

  end
end

context "管理者権限を持ったユーザーを0にしようとすると" do
  it "コールバックされてユーザー一覧ページに遷移して削除できない理由が通知される" do
    
  end
end
  end
end
