class ApplicationController < ActionController::Base

    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @current_hospital_admin = HospitalAdmin.find(@decoded[:hospital_admin_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
        end
    end 
end
