class ArticlesController < ApplicationController
  #sert a donner accès a une méthode en précisant les méthodes qui pourront l'utiliser
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all
  end

  def edit

  end

  def new
    @article = Article.new
  end

  def create
    #debugger
    #render plain sert a attraper et afficher les params envoyé dans l'url a la creation
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    #seul moyen de définir a la creattion d'un article qu'il doit détenir a un user
    @article.user = User.first

    #Si article bien sauvegarder alors... sinon
    if @article.save
      flash[:success] = "Article was succesfully created"
      #redirige sur page de l'article
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update

    if @article.update(article_params)
      flash[:success] = "Article was sussessfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def show

  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

#Factorisation de code récurrent
  private
    #cf before_action qui définit les méthodes qui auront accès a cette méthode
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      #défini les params de l'article
      params.require(:article).permit(:title, :description)
    end
end
