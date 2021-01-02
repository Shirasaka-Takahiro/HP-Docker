class ArticlesController < ApplicationController

 # 記事の一覧表示
  def index
   
    @articles = Article.all

    if params[:tag_name]
       @articles = Article.tagged_with("#{params[:tag_name]}")
    end

  end

  def tag
    @articles = Article.tagged_with(params[:name])
    @tags = Article.tag_counts_on(:tags)
    
    render 'index'
  end

 # 記事の表示
  def show
    
    @article = Article.find(params[:id])

  end

 # 記事の作成

  def new 
    
    @article = Article.new
    @article = current_user.articles.build
 
  end

  # 記事の登録
  def create
 
    @article = current_user.articles.build(article_params)

    if @article.save
       redirect_to @article
       flash[:notice] = "記事[#{@article.title}]を投稿しました。"
    else
       render 'new'
    end

  end

  # 記事の編集
  def edit

    @article = Article.find(params[:id])

  end

  # 記事の更新
  def update

    @article = Article.find(params[:id])

    if @article.update(article_params)
       redirect_to @article
       flash[:notice] = "記事[#{@article.title}]を更新しました。"
    else
       render 'edit'
    end

  end

  # 記事の削除
  def destroy
  
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path

  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :tag_list)
  end

end
