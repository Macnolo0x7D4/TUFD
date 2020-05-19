class User < ApplicationRecord
  include ActionText::Attachable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :trackable

  has_person_name
  has_many :articles
  has_many :comments
  has_many :category_articles

  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :notifications, foreign_key: :recipient_id
  has_many :services

  def to_trix_content_attachment_partial_path
    to_partial_path
  end
end
