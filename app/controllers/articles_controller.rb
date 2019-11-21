class ArticlesController < ApplicationController

  def index

  end

  def new
    @article = Article.new
  end

  def create
    #render plain sert a attraper et afficher les params envoyé dans l'url a la creation
    # render plain: params[:article].inspect
    @article = Article.new(article_params)

    #Si article bien sauvegarder alors... sinon
    if @article.save
      flash[:notice] = "Article was succesfully created"
      #redirige sur page d'accueil des articles
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      #défini les params de l'article
      params.require(:article).permit(:title, :description)
    end
end
