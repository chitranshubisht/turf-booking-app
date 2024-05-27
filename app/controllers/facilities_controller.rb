class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show]

  # GET /facilities or /facilities.json
  def index
    @facilities = Facility.all
    @facilities = @facilities.where(name: params[:facility_name]) if params[:facility_name].present?
    # Other filtering logic can be added here
    
    respond_to do |format|
      format.html # Render HTML by default
      format.json { render json: @facilities } # Optionally, handle JSON format
    end
  end

  # GET /facilities/1 or /facilities/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def facility_params
      params.require(:facility).permit(:name, :description, :location, :images)
    end
end
