class PictureSerializer < ActiveModel::Serializer
  attributes :id, :belongs_to, :image, :caption

  def initialize(picture: nil)
    @picture = picture
  end

  def serialize_new_picture()
    serialized_new_picture = serialize_picture(@picture)
    serialized_new_picture.to_json()
  end

  private def serialize_picture(picture)
    {
      picture: {
        id:picture.id,
        image_url: picture.get_image_url(),
        caption: picture.caption,
      }
    }
  end

end
