class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email_address, :is_public
  has_many :photos
  has_many :albums
end
