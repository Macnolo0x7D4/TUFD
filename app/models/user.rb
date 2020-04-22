require 'digest'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :articles
  has_many :comments
  has_many :category_articles

  def process_avatar
    unless avatar_url.nil? or avatar_url.empty?
      hash = Digest::MD5.hexdigest user.email
      User.update self, {:avatar_url => "http://www.gravatar.com/avatar/#{hash}"}
    end
  end
end
