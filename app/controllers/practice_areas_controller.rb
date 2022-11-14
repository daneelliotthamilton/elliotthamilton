class PracticeAreasController < ApplicationController
  before_action :set_practice_area, only: %i[ show edit update destroy ]

  # GET /practice_areas or /practice_areas.json
  def index
    @practice_areas = PracticeArea.all
  end

  # GET /practice_areas/1 or /practice_areas/1.json
  def show
  end

  # GET /practice_areas/1/edit

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_practice_area
      @practice_area = PracticeArea.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def practice_area_params
      params.require(:practice_area).permit(:title, :description)
    end
end
