class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.favorite_topics
  end
  
  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    
    if comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      redirect_to topics_path, danger: 'コメントの投稿に失敗しました'
    end
  end
end
