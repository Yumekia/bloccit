class CommentPolicy < ApplicationPolicy
  def new
    user.present?
  end
  
  def create
    user.present? && user.admin?
  end
  
end