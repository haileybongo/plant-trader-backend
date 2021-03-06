class Api::UsersController < ApplicationController

    def create
        binding.pry
        user = User.new(user_params)
    end

    def show
      render json: UserSerializer.new(current_user)
    end

    def update
      current_user.bio = params[:bio]
      current_user.username = params[:username]
      current_user.save
      render json: UserSerializer.new(current_user)
    end
    
    def follow
        @user = User.find(params[:id])
        current_user.followees << @user
        redirect_back(fallback_location: user_path(@user))
      end
      
      def unfollow
        @user = User.find(params[:id])
        current_user.followed_users.find_by(followee_id: @user.id).destroy
        redirect_back(fallback_location: user_path(@user))
      end

      private

      def user_params
        params.require(:user).permit(:email, :username, :bio)
    end

end
