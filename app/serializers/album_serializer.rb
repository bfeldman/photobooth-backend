class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :username, :photo_ids, :name
  
  def username
    user = User.find(object.user_id)
    user.username
  end
  
end
