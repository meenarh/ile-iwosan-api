class API::V1::Auth::SessionsController < ApplicationController

    def create
        @hospital_admin = HospitalAdmin.find_by_email(user_params[:email])
        if @hospital_admin&.authenticate(params[:password])
            if @hospital_admin.is_a?(HospitalAdmin)
                @hospital_admin = HospitalAdminSerializer.new(@hospital_admin).serializable_hash.to_json
            end
            render json: { hospital_admin: @hospital_admin, token: JsonWebToken.encode(hospital_admin_id: @hospital_admin.id) }, status: :ok
        else
            render json: { error: 'Invalid credentials' }, status: :unauthorized
        end           
    end

    private

    def user_params
        params.permit(:email, :password)
    end
end