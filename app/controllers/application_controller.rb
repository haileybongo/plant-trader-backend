class ApplicationController < ActionController::API
        include ActionController::Cookies
        include ActionController::RequestForgeryProtection
        include Secured
        before_action :authorized
      
        
      
          def current_user
            if auth_token
                @user = User.find_by(email: params[:email])
                binding.pry
                if @user
                  @user 
                else
                  User.new(email: params[:email])
                end
            else
              render json: { message: 'Please log in' }
            end
          end
          
            def logged_in?
              !!current_user
            end
         
      
          def authorized
              render json: { message: 'Please log in' }, status: :unauthorized unless auth_token
            end
     
        end
      
