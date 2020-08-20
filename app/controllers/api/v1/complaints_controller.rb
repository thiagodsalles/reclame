module Api
  module V1
    class ComplaintsController < ApplicationController
      before_action :set_complaint, only: %i[show update destroy]

      def index
        @complaints = Complaint.where(index_params)
        render json: @complaints
      end

      def show
        render json: @complaint
      end

      def create
        address_data = GetAddressByGeocodeService.call(params[:complaint][:locale])
        @complaint   = Complaint.new(create_params.merge(address_data))

        if @complaint.save
          render json: @complaint, status: :created
        else
          render json: @complaint.errors, status: :unprocessable_entity
        end
      end

      def update
        if @complaint.update(update_params)
          render json: @complaint
        else
          render json: @complaint.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @complaint.destroy.destroyed?
          render json: @complaint
        else
          render json: @complaints.erros, status: :unprocessable_entity
        end
      end

      private

      def index_params
        params.permit(:title, :company, :country, :state, :city, :latitude, :longitude, :suburb)
      end

      def update_params
        params.require(:complaint)
              .permit(:title, :description, :company, :country, :state, :city, :latitude, :longitude, :suburb)
      end

      def create_params
        params.require(:complaint).permit(:title, :description, :company)
      end

      def set_complaint
        @complaint = Complaint.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :not_found
      end
    end
  end
end
