class FavoritesController < ApplicationController
  def create
   favorite = current_user.favorites.create(neta_id: params[:neta_id])
   redirect_to netas_url, notice: "#{favorite.neta.user.name}さんのブログをお気に入り登録しました"
 end
 def destroy
   favorite = current_user.favorites.find_by(id: params[:id]).destroy
   redirect_to netas_url, notice: "#{favorite.neta.user.name}さんのブログをお気に入り解除しました"
 end
 def show
   @user = current_user
   @favorites = @user.favorite_netas
 end
end
