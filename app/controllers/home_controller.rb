class HomeController < ApplicationController
  def index
 
    @articles = Article.order("RAND()").limit(4)

  end
end
