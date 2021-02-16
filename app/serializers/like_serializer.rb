class LikeSerializer 
  include JSONAPI::Serializer
  attributes :id, :belongs_to, :belongs_to
end
