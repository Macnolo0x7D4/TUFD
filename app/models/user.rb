require 'digest'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :articles
  has_many :comments
  has_many :likes
  has_many :category_articles

  def avatar
    hash = Digest::MD5.hexdigest email
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def avatar_profile
    hash = Digest::MD5.hexdigest email
    "http://www.gravatar.com/avatar/#{hash}?s=300"
  end
end
