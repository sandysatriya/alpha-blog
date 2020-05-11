class ArticlesController < ApplicationController
  def show
    # byebug => debugger
    @article = Article.find(
      params[:id]
    )
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(
      params[:id]
    )
  end

  def create
    # render json: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "Article was updated succefully."
        redirect_to @article
    else
        render "edit"
    end
  end
end
