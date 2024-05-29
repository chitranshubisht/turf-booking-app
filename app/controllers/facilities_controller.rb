class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show]

  def index
    @facilities = Facility.all
    @facilities = @facilities.where(name: params[:facility_name]) if params[:facility_name].present?
    @facilities = @facilities.where(pincode: params[:pincode]) if params[:pincode].present?

    respond_to do |format|
      format.html
      format.json { render json: @facilities }
    end
  end

  def show
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:name, :description, :location, :images)
  end
end
