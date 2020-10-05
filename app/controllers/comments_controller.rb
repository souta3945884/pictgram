class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.favorite_topics
  end
  
  def new
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
  end
  
  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    @comment.description = params[:description]
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      render action: :new
    end
  end
end
