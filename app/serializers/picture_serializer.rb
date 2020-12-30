class PictureSerializer < ActiveModel::Serializer
  attributes :id, :belongs_to, :file, :caption
end
