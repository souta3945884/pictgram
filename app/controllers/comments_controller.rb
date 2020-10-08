class CommentsController < ApplicationController
 
  
  def new
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
  end
  
  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:comment][:topic_id]
    @comment.description = params[:comment][:description]
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:description, :topic_id)
  end
  
end
