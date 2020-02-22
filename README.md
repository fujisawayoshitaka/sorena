# README

## Sorena

## 概要
ユーザーが駅ごとにローカルネタを投稿するアプリ

## コンセプト
簡単に駅ごとにローカルネタを投稿、閲覧ができるアプリ
ユーザーの知らない地方都市に転勤になった際に、言い知れぬ不安を抱く可能性が高い。netでググってもマクロな事						
しかわからないので実際に生活してみないと実態はわからない事が課題である。その最たる解決方法はその地域の方と交流						
する事だが知り合いがその地域にいないと交流することは容易ではない。そこで地域の事柄や事象を匿名で共有できるblog						
機能アプリSorenaを作成し交流の場を提供したい。レイアウトをボケてを参考にして作成する。						
具体的には駅名ごとに独立したブログアプリを作成する。						



## 機能一覧

1. ログイン機能
2. 駅(rabel)登録機能
3. Sorena（お気に入り)機能
4. Netaに関するコメント機能
5. ユーザー管理機能

### バージョン情報
ruby 2.6.5
Rails 5.2.4.1
### カタログ設計
https://docs.google.com/spreadsheets/d/1RtC_5ifdGQawObQW1Nrd6X_kwMgno-VV-vMizaLEm4o/edit#gid=0
### テーブル定義書
https://docs.google.com/spreadsheets/d/1RtC_5ifdGQawObQW1Nrd6X_kwMgno-VV-vMizaLEm4o/edit#gid=663056640
### ER図
https://docs.google.com/spreadsheets/d/1RtC_5ifdGQawObQW1Nrd6X_kwMgno-VV-vMizaLEm4o/edit#gid=1268718220
### 画面遷移図
https://docs.google.com/spreadsheets/d/1RtC_5ifdGQawObQW1Nrd6X_kwMgno-VV-vMizaLEm4o/edit#gid=1425597137
### ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1RtC_5ifdGQawObQW1Nrd6X_kwMgno-VV-vMizaLEm4o/edit#gid=1788653730
### 使用予定Gem
ログイン機能　device,rails_admin
検索機能　ransack
cssフレームワーク　bootstrap
jsフレームワーク　jquery-rails
