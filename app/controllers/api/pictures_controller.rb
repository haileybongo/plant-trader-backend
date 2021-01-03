class Api::PicturesController < ApplicationController

    def create
        picture = Picture.new(file => params[:file], caption => params[:caption])
        binding.pry
        if picture
            picture.user = current_user
            render json
        else
            render json: "Error"
        end
    end
    


    
    private
        def picture_params
        params.require(:picture).permit(:email, :file, :caption)
        end
end
