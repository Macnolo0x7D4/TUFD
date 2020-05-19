class ArticleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.user_mention.subject
  #
  def user_mention(article, user)
    @article, @user = article, user
    mail to: user.email, subject: "Mentioned in an Article"
  end
end
