require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @neta = FactoryBot.create(:neta, user_id: @user.id)
    @second_neta = FactoryBot.create(:second_neta, user_id: @user.id)
    @favorite = Favorite.create(user_id: @user.id, neta_id: @neta.id)
  end

  it "新しい投稿をお気に入りできる" do
    favorite = Favorite.new(user_id: @user.id, neta_id: @second_neta.id)
    expect(favorite).to be_valid
  end

  it "複数の投稿をお気に入りできる" do
    favorite = Favorite.create(user_id: @user.id, neta_id: @second_neta.id)
    expect(favorite).to be_valid
  end

  it "user_idが空だとバリデーションが通らない" do
    favorite = Favorite.create(user_id: "", neta_id: @neta.id)
    expect(favorite).not_to be_valid
  end

  it "neta_idが空だとバリデーションが通らない" do
    favorite = Favorite.create(user_id: @user.id, neta_id: "")
    expect(favorite).not_to be_valid
  end

  it "同じ投稿をお気に入りしようとするとバリデーションが通らない" do
    favorite = Favorite.create(user_id: @user.id, neta_id: @neta.id)
    expect(favorite).not_to be_valid
  end
end
