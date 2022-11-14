class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.published
  end

  # GET /articles/1 or /articles/1.json
  def show
  end


  def tags
    @page = params[:page]
    @tags = ActsAsTaggableOn::Tag.by_tag_name(params[:q]).page(@page).token_input_tags
    respond_to do |format|
      format.json
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :subtitle, :category, :description, :body)
    end
end
