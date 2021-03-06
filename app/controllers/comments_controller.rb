class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @like = Like.find_or_initialize_by(article: @article, user: current_user)
    comment_params = params.require(:comment).permit(:commenter, :body)
    @comment = Comment.new(article_id: @article.id)
    @comment.attributes = comment_params
    if @comment.save
      session[:commenter] = @comment.commenter
      UserMailer.article_commented(@article.id).deliver_later
      redirect_to article_path(@comment.article)
    else
      render 'articles/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to article_path(@comment.article)
  end
end
