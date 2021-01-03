require_relative '/Users/haileybongo/Development/code/PlantTrader/plant-tracker-backend/lib/json_web_token.rb'

module Secured
    extend ActiveSupport::Concern
  
    included do
      before_action :authenticate_request!
    end
  
    private
  
    def authenticate_request!
      auth_token
      binding.pry
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  
    def http_token
      if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end
  
    def auth_token
      JsonWebToken.verify(http_token)
    end
  end