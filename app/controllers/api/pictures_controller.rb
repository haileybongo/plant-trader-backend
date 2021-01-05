class Api::PicturesController < ApplicationController

    def create
        @picture = Picture.new
        current_user.pictures << @picture
        @picture.save
        @picture.image.attach(params[:image]) 
        respond_to_picture()
    end
    


    
    private
        def picture_params
        params.require(:picture).permit(:email, :file, :caption, :image)
        end

        def respond_to_picture()
            picture_serializer = PictureSerializer.new(picture: @picture)
            render json: picture_serializer.serialize_new_picture()
        end
end
