class FollowSerializer
  include JSONAPI::Serializer
  attributes :id, :follower_id, :followee_id
end
