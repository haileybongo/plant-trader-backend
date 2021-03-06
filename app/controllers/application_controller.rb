class ApplicationController < ActionController::API
        include ActionController::Cookies
        include ActionController::RequestForgeryProtection
        include Secured
        before_action :authorized

        
      
          def current_user
            if auth_token
                @user = User.find_by(authId: params[:id])
                if @user
                  @user 
                else
                  @user = User.new(authId: params[:id])
                  @user.save
                  @user
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
      
