require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  before do
    #FactoryBot.create(:label)
    #FactoryBot.create(:label2)
    FactoryBot.create(:user)
    visit new_session_path
    fill_in 'Email', with: '1@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    click_link 'netaを作成する'

  end

  describe 'タスク一覧画面' do
    context 'タスクを作成した場合' do
      it '作成済みのタスクが表示されること' do

      visit new_task_path

      fill_in 'task_title', with: 'yoshitaka1'
      fill_in 'task_content', with: 'yoshitaka1'

      find("option[value='未着手']").select_option

      click_button '登録する'

      expect(page).to have_content 'yoshitaka1'
      end
    end
    context '複数のタスクを作成した場合' do
      it 'タスクが作成日時の降順に並んでいること' do
        visit new_task_path

        fill_in 'task_title', with: 'yoshitaka2'
        fill_in 'task_content', with: 'yoshitaka2'

        find("option[value='未着手']").select_option

        click_button '登録する'
        visit new_task_path
        fill_in 'task_title', with: 'yoshitaka1'
        fill_in 'task_content', with: 'yoshitaka1'

        find("option[value='未着手']").select_option

        click_button '登録する'
        visit tasks_path
        expect(page).to have_text /.*yoshitaka1.*yoshitaka2.*/m
      end
    end
    context '複数のタスクを作成後、終了期限でソートのタグをクリックすると' do
      it '終了期限の昇順に並んでいること' do
        visit new_task_path

        fill_in 'task_title', with: 'yoshitaka2'
        fill_in 'task_content', with: 'yoshitaka2'

        find("option[value='未着手']").select_option

        click_button '登録する'
        visit new_task_path
        fill_in 'task_title', with: 'yoshitaka1'
        fill_in 'task_content', with: 'yoshitaka1'

        find("option[value='未着手']").select_option

        click_button '登録する'
        visit tasks_path
        click_link '終了期限でソートする'
        expect(page).to have_text /.*yoshitaka2.*yoshitaka1.*/m
      end
    end

    context '複数のタスクを作成後、状態の検索を行うと' do
      it '指定した状態を持ったタスクのみ抽出できること' do

        visit new_task_path

        fill_in 'task_title', with: 'yoshitaka2'
        fill_in 'task_content', with: 'yoshitaka2'

        find("option[value='未着手']").select_option
        click_button '登録する'
        visit new_task_path
        fill_in 'task_title', with: 'yoshitaka1'
        fill_in 'task_content', with: 'yoshitaka1'

        find("option[value='着手']").select_option

        click_button '登録する'
        visit tasks_path
        find("option[value='未着手']").select_option
        click_button '検索'
        expect(page).to have_text '未着手'
      end
    end


  end

  describe 'タスク登録画面' do

    context '必要項目を入力して、createボタンを押した場合' do
      it 'データが保存されること' do

      visit new_task_path
      fill_in 'task_title', with: 'task'
      fill_in 'task_content', with: 'task'
      find("option[value='未着手']").select_option



      click_button '登録する'
      expect(page).to have_content 'task'
      end
    end
  end


  describe 'タスク詳細画面' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示されたページに遷移すること' do
         visit new_task_path
         fill_in 'task_title', with: 'task'
         fill_in 'task_content', with: 'task'
         find("option[value='未着手']").select_option
         click_button '登録する'
         visit tasks_path

         click_link 'Show'
         expect(page).to have_content 'task'
       end
     end
  end

  describe 'ラベル機能のテスト' do
     context 'ラベルを付与したタスクを作成し' do
       it '該当タスクの詳細ページに遷移するとラベルの内容が記述されている' do
         visit new_task_path

         fill_in 'task_title', with: '1'
         fill_in 'task_content', with: '1'
         find("option[value='未着手']").select_option
         checkbox = find('#task_label_ids_1')
         check 'task_label_ids_1'
         click_button '登録する'
         visit tasks_path
         click_link 'Show'
         expect(page).to have_content 'sample1'
       end
     end

     context 'ラベル検索すると' do
       it 'その検索したラベルを持っている該当タスクのみ表示される' do
         visit new_task_path
         fill_in 'task_title', with: 'sample1'
         fill_in 'task_content', with: 'sample1'
         find("option[value='未着手']").select_option
         checkbox = find('#task_label_ids_1')
         check 'task_label_ids_1'
         click_button '登録する'
         visit new_task_path
         fill_in 'task_title', with: 'sample2'
         fill_in 'task_content', with: 'sample2'
         find("option[value='未着手']").select_option
         checkbox = find('#task_label_ids_2')
         check 'task_label_ids_2'
         click_button '登録する'
         visit tasks_path
         fill_in 'label_search', with: 'sample2'
         click_button '検索'
         expect(page).not_to have_content 'sample1'
         expect(page).to have_content 'sample2'
       end
     end



  end

end
