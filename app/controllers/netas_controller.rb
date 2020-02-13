class NetasController < ApplicationController
    before_action :set_neta, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @netas = Neta.all
  end

  def new
    @neta = Neta.new
  end

  def create
    @neta = current_user.netas.build(neta_params)
    if @neta.save
      redirect_to netas_path, notice: "ネタを作成しました！"
    else
      render :new
    end
  end

  def show
    @comments = @neta.comments
    @comment = @neta.comments.build
    if current_user.present?
      @favorite = current_user.favorites.find_by(neta_id: @neta.id)
    end
  end

  def edit

  end

  def update
    if @neta.update(neta_params)
      redirect_to netas_path, notice: "ネタを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @neta.destroy
    redirect_to netas_path, notice:"ネタを削除しました！"
  end

  def confirm
    @neta = current_user.netas.build(neta_params)
  end

  private

  def neta_params
    params.require(:neta).permit(:image, :image_cache, :content)
  end

  def set_neta
    @neta = Neta.find(params[:id])
  end

end
