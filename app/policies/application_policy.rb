class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    user.present? && user.role?(:admin)
  end

  def create?
    user.present? && user.role?(:admin)
  end

  def new?
    create?
  end

  def update?
    user.present? && user.role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end
end

