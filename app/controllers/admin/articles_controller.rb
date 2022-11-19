class Admin::ArticlesController < AdminController
    before_action :set_article, only: %i[ show edit update destroy publish unpublish schedule unschedule ]
  
    # GET /articles or /articles.json
    def index
      @articles = Article.all
    end
  
    # GET /articles/1 or /articles/1.json
    def show
    end
  
    # GET /articles/new
    def new
      @article = Article.new
    end
  
    # GET /articles/1/edit
    def edit
    end
  
    # POST /articles or /articles.json
    def create
      @article = Article.new(article_params)
  
      respond_to do |format|
        if @article.save
          format.html { redirect_to admin_article_url(@article), notice: "Article was successfully created." }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /articles/1 or /articles/1.json
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to admin_article_url(@article), notice: "Article was successfully updated." }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /articles/1 or /articles/1.json
    def destroy
      @article.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_articles_url, notice: "Article was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def publish
      if @article.publish
        redirect_to admin_article_url(@article), notice: "Article was publsihed." 
      else
        render :show
      end
    end

    def unpublish
      @article.unpublish
    end

    def schedule
      respond_to do |format|
        if @article.schedule(schedule_params)
          format.html { redirect_to admin_article_url(@article), notice: "Article was scheduled for publication."}
        else
          format.html { render :show }
        end
      end
    end

    def unschedule
      @article.unschedule
      respond_to do |format|
        format.html { redirect_to admin_article_url(@article), notice: "Article removed from publication schedule."}
      end
    end
  
    def tags
      @page = params[:page]
      @tags = ActsAsTaggableOn::Tag.by_tag_name(params[:q]).page(@page).token_input_tags
      respond_to do |format|
        format.json
      end
    end

    def published
      @articles = Article.published
      render :index
    end

    def draft
      @articles = Article.draft
      render :index
    end

    def scheduled
      @articles = Article.scheduled
      render :index
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.friendly.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def article_params
        params.require(:article).permit(:title, :subtitle, :description, :body)
      end

      def schedule_params
        params.require(:article).permit(:scheduled_at)
      end
  end
  