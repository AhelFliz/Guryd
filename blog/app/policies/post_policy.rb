class PostPolicy < ApplicationPolicy
  alias post record

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    post.user == user || user&.admin?
  end

  def update?
    edit?
  end
end
