class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email_address, :is_public
end
