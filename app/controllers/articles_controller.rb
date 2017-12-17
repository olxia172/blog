class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].present?
      @articles = Article.where("? = any(tags)", params[:q])
      #@articles = Article.all.order(created_at: :desc).select do |article|
      #  article.tags.include?(params[:q])
      #end
      session[:q] = params[:q]
    else
      @articles = Article.all.order(created_at: :desc)
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new(commenter: session[:commenter])
  end

  def edit
  end

  def update
    @article.attributes = article_params
    if @article.save
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :tags)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
