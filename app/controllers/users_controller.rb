class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @article = Article.all
    @articles = @user.articles.last(3)
  end

  def edit
  end
end
