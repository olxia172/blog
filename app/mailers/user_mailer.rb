class UserMailer < ApplicationMailer
  def article_commented(article)
    @article = article

    mail subject: "Article was commented", to: @article.author.email
  end
end
