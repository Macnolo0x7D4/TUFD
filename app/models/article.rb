class Article < ApplicationRecord
  has_rich_text(:content)
  belongs_to :user
  has_many :category_articles
  has_many :comments
  has_many :categories, :through => :category_articles

  after_create :send_notifications

  def save_category
    return category_articles.destroy_all if category_ids.nil? || category_ids.empty?

    category_articles.where.not(category_id: category_ids).destroy_all

    CategoryArticle.find_or_create_by(article: self, category_id: category_ids)

  end

  def send_notifications
    users = users_mentions
    users.each do | user |
      ArticleMailer.user_mention(self, user).deliver_now
    end
  end

  def users_mentions
    @users ||= content.body.attachments.select{ |a| a.attachable.class == User}.map(&:attachable).uniq
  end

end
