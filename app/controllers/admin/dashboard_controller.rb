class Admin::DashboardController < AdminController

  def index
    @profiles = Profile.all
    @articles = Article.all
    @pages = Page.all
    @practice_areas = PracticeArea.all
  end
  
end