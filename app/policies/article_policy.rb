class ArticlePolicy < ApplicationPolicy
  def update?
    record.author == user
  end

  def destroy?
    record.author == user
  end

  def permitted_attributes
    [:title, :text, :tags, :banner]
    # %i[title text tags banner]
  end
end
