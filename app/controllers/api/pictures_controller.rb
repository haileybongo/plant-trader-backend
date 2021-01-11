class Api::PicturesController < ApplicationController

    def new
        @picture = Picture.new
        current_user.pictures << @picture
        @picture.caption = params[:caption]
        @picture.save
        @picture.image.attach(params[:image]) 
        pictures = current_user.pictures
        render json: PictureSerializer.new(pictures)
    end

    def userpictures
        pictures = current_user.pictures
        render json: PictureSerializer.new(pictures)
    end
    


    
    private
        def picture_params
        params.require(:picture).permit(:id, :file, :caption, :image)
        end

        def respond_to_picture()
            picture_serializer = PictureSerializer.new(picture: @picture)
            render json: picture_serializer.serialize_new_picture()
        end
end
