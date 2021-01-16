class HomeController < ApplicationController
  def index
 
    @articles = Article.order("RAND()").limit(3)

  end
end
