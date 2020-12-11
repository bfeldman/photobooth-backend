class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :is_public, :base64_src, :comments
  
  def comments
    ActiveModelSerializers::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
  
end
