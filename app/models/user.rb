class User < ApplicationRecord
  has_secure_password
  has_many :photos
  accepts_nested_attributes_for :photos
  validates :username, uniqueness: {case_sensitive: false}
end