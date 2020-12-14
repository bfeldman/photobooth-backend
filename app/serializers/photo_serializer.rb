class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :is_public, :comments, :created_at, :base64_src
  
  def comments
    ActiveModelSerializers::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
  
end
