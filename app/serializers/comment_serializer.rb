class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :username, :content, :created_at
  
  def username
    user = User.find(object.user_id)
    user.username
  end
  
end
