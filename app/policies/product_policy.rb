class ProductPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    true
  end

  def show?
    @product.user_id == @user.id || @user.admin?
  end

  def create?
    @user.admin?
  end

  def update?
    @user.admin? || (@product.user_id == @user.id)
  end

  def destroy?
    @user.admin? || (@product.user_id == @user.id)
  end
end
