class CommentsController < ApplicationController
before_action :set_neta, only: [:create, :edit, :update, :destroy]

  def create
  @comment = @neta.comments.build(comment_params)
  @comment.user_id = current_user.id
  
  respond_to do |format|
    if @comment.save
          flash.now[:notice] = 'コメントが投稿されました'
          format.js { render :index }
        else
          flash.now[:notice] = '文字数は1文字以上150文字以内にしてください'
          format.js { render :error }
        end
      end
  end

 def destroy
   @comment = Comment.find(params[:id])
     @comment.destroy
     respond_to do |format|
       flash.now[:notice] = 'コメントが削除されました'
       format.js { render :index }
     end
  end

  def edit
    @comment = @neta.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @neta.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = '文字数は1文字以上150文字以内にしてください'
          format.js { render :edit_error }
        end
      end
  end


 private

 def comment_params
   params.require(:comment).permit(:neta_id, :content)
 end

 def set_neta
   @neta = Neta.find(params[:neta_id])
 end
end
