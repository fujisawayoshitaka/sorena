class CommentsController < ApplicationController
  def create
  # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
  @neta = Neta.find(params[:neta_id])
  @comment = @neta.comments.build(comment_params)
  @comment.user_id = current_user.id
  # クライアント要求に応じてフォーマットを変更
  respond_to do |format|
    if @comment.save
      format.js { render :index }
    else
      format.html { redirect_to neta_path(@neta), notice: '投稿できませんでした...' }
    end
  end
 end

 def destroy
    @comment = Comment.find(params[:id]) #⑤
    if @comment.destroy
      render :index #⑥
    end
  end

 private
# ストロングパラメーター
 def comment_params
   params.require(:comment).permit(:neta_id, :content)
 end
end
