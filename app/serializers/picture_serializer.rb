class PictureSerializer 
  include JSONAPI::Serializer

  attributes :id, :caption, :user, :likes, :comments
  attribute :get_image_url

end
