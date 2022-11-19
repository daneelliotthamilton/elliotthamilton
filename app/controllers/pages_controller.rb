class PagesController < ApplicationController
  layout 'landing', only: [:landing]

  def show
    @page = Page.find_by_url(params[:page])
    if valid_page?
      @feedback = Support::Feedback.new if params[:page] == "contact"
      render template: "pages/#{params[:page]}"
    elsif @page.present?
      render template: "pages/show"
    else
      redirect_to "/404.html", status: :not_found
    end
  end

  def home
    @articles = Article.published.last(3)
  end

  def landing
    @feedback = Support::Feedback.new
  end

  private

  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end

end
