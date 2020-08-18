class Api::V1::ComplaintsController < ApplicationController
  before_action :set_complaint, only: %i[show update destroy]

  def index
    @complaints = SearchComplaintQuery.new.call(
      title: params[:title],
      company: params[:company],
      country: params[:country],
      state: params[:state],
      city: params[:city],
      latitude: params[:latitude],
      longitude: params[:longitude],
      suburb: params[:suburb]
    )
    render json: @complaints
  end

  def show
    render json: @complaint
  end

  def create
    allowed_params = params.require(:complaint).permit(:title, :description, :company)
    address_data   = GetAddressByGeocodeService.call(params[:complaint][:locale])
    @complaint     = Complaint.new(allowed_params.merge(address_data))

    if @complaint.save
      render json: @complaint, status: :created
    else
      render json: @complaint.errors, status: :unprocessable_entity
    end
  end

  def update
    allowed_params = params.require(:complaint).permit(:title, :description, :company, :country, :state, :city,
                                                       :latitude, :longitude, :suburb)
    if @complaint.update(allowed_params)
      render json: @complaint
    else
      render json: @complaint.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: { message: 'deleted successfully' } if @complaint.destroy
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end
end
