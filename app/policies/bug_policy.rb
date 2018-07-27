class BugPolicy < ApplicationPolicy
 
  def index?
    user.present?
  end

  def create?
    user.present? && user.user_type == 'qa'
  end

  def new?
    user.present? && user.user_type == 'qa'
  end


end