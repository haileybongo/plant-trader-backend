class CommentSerializer 
  include JSONAPI::Serializer
  attributes :id, :belongs_to, :belongs_to, :content
end
