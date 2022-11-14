class Admin::PagesController < AdminController
  before_action :set_page, only: [:edit, :show, :update, :destroy]
  
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:success] = "Page successfully created"
      redirect_to admin_page_url(@page)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

    def page_params
      params.require(:page).permit(:title, :url, :content,
                                  tags_attributes: [:id, :property_type, :property, :content, :_destroy])
    end

    def set_page
      @page = Page.find(params[:id])
    end
  
end