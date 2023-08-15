class Api::V1::HospitalAdminsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
    before_action :set_hospital_admin!, only: [:show, :update, :destroy]

    def show
        render json: HospitalAdminSerializer.new(@hospital_admin, options).serializable_hash.to_json, status: :ok
    end

    def create
        @hospital_admin = HospitalAdmin.new(hospital_admin_params)
        if @hospital_admin.save
            render json: HospitalAdminSerializer.new(@hospital_admin).serializable_hash.to_json, status: :created
        else
            render json: { error: @hospital_admin.errors.messages }, status: :unprocessable_entity
        end
    end

    def update
        @hospital_admin = HospitalAdmin.find(params[:id])
        render json: HospitalAdminSerializer.new(@hospital_admin).serializable_hash.to_json, status: :ok
    end

    def destroy
        @hospital_admin = HospitalAdmin.find(params[:id])
        @hospital_admin.destroy
        head :no_content
    end

    private

    def hospital_admin_params
        params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def set_hospital_admin
        render json: { errors: ["Hospital Admin not found"]}, status: :not_found unless current_hospital_admin
    end
end
