class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
  validates :email_address, uniqueness: {case_sensitive: false}
  
  has_many :photos
  has_many :albums
  accepts_nested_attributes_for :photos
end