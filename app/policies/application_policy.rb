class ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    true
  end

  def show?
    # scope.where(:id => project.id).exists?
    
  end

  def create?
    true
  end

  def new?
    create?
    true
  end

  def update?
    true
  end

  def edit?
    update?
    true
  end

  def destroy?
    true
  end

  def scope
    Pundit.policy_scope!(user, project.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
