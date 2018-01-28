class UserMailer < ApplicationMailer
  def article_commented(article_id)
    @article = Article.find(article_id)

    mail subject: "Article was commented", to: @article.author.email
  end
end
