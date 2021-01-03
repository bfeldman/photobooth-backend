class PhotoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :is_public, :comments, :created_at, :image_file #, :base64_src
  
  def comments
    ActiveModelSerializers::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
  
  def image_file
    rails_blob_path(object.image_file)
  end
  
end
