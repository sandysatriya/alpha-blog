class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    # byebug => debugger
    # @article = Article.find(
    #   params[:id]
    # )
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    # @article = Article.find(
    #   params[:id]
    # )
  end

  def create
    # render json: params[:article]
    @article = Article.new(article_params)
    # @article.user = User.find(session[:user_id]) ini juga bisa di pake
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created succesfully."
      redirect_to @article
      # redirect_to article_path(@article)
      # render json: @article => if u want to render json the method save must have ! (ex: @article.save!)
    else
      render "new"
    end
  end

  def update
    # @article = Article.find(params[:id])
    if @article.user == current_user
      if @article.update(article_params)
        flash[:notice] = "Article was updated succefully."
        redirect_to @article
      else
        render "edit"
      end
    else
      flash[:notice] = "You don't have permission to edit this article"
      render "edit"
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or delete your own aticle"
      redirect_to @article
    end
  end
end
