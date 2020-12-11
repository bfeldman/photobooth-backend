class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :username
  
  def username
    user = User.find(object.user_id)
    user.username
  end
  
end
