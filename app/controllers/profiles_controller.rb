class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show ]

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:title, :bio, :education, :vcard, :email, :avatar, :bar_admissions, :expertise)
    end
end
