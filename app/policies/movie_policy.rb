# frozen_string_literal: true

class MoviePolicy < ApplicationPolicy
  def create?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
end
