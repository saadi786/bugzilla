class ProjectPolicy < ApplicationPolicy
  # our authorization rules will go here

   def index?
    user.present?
   end

   def create?
    user.present? && user.user_type == 'manager'
   end

    def new?
    user.present? && user.user_type == 'manager'
   end

    # def show?
    # user.present? && user.user_type == 'manager'
    # end


    #@REVIEW: ADD IF PROJECT BELONGS TO USER
   def edit?
    user.present? && user.user_type == 'manager'
   end

   def update?
    user.present? && user.user_type == 'manager'
    
   end

    def destroy?
    user.present? && user.user_type == 'manager'
   end
end