class Article < ApplicationRecord
  has_rich_text(:content)
  belongs_to :user
  has_many :category_articles
  has_many :comments
  has_many :likes
  has_many :categories, :through => :category_articles

  attr_accessor :category_elements

  def save_category
    return category_articles.destroy_all if category_ids.nil? || category_ids.empty?

    category_articles.where.not(category_id: category_ids).destroy_all

    CategoryArticle.find_or_create_by(article: self, category_id: category_ids)

  end
end
