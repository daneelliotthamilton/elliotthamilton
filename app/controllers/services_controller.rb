class ServicesController < ApplicationController
  before_action :set_practice_area, except: [:index]
  before_action :set_service, only: %i[ show ]

  # GET /services or /services.json
  def index
    @services = Service.all
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = @practice_area.services.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.friendly.find(params[:id])
    end

    def set_practice_area
      @practice_area = PracticeArea.friendly.find(params[:practice_area_id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:title, :category, :description, :content)
    end
end
