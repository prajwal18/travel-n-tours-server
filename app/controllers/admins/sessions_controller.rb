# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    respond_to :json
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end

    private

    def respond_with(resource, _opts = {})
      if current_admin
        render json: {
          admin: current_admin,
          status: { code: 200, message: 'Logged in sucessfully.' },
          data: AdminSerializer.new(resource).serializable_hash[:data][:attributes]
        }, status: :ok
      else
        render json: {
          status: 401,
          message: 'Login details did not match,'
        }, status: :unauthorized
      end
    end

    def respond_to_on_destroy
      if current_admin
        render json: {
          status: 200,
          message: 'logged out sucessfully'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session,"
        }, status: :unauthorized
      end
    end
  end
end