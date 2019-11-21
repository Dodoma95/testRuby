class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    #render plain sert a attraper et afficher les params envoyé dans l'url a la creation
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
    def article_params
      #défini les params de l'article
      params.require(:article).permit(:title, :description)
    end
end
