class ArticlesController < ApplicationController
  def show
    # byebug => debugger
    @article = Article.find(
      params[:id]
    )
  end
end
