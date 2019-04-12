class ArticlesController < ApplicationController
  before_action :set_article, only: [:update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
   @article = current_user.articles.create!(article_params)
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    @article.update!(article_params)
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
