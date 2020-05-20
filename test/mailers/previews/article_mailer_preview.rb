# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/user_mention
  def user_mention
    ArticleMailer.user_mention
  end
end
