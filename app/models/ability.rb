class Ability
  include CanCan::Ability

  def initialize(admin_user)
    return unless admin_user

    case admin_user.role
    when 'super_admin'
      can :manage, :all
    when 'manager'
      can :read, :all
      can :create, Product
      can :update, Product
      can :destroy, Product
    when 'staff'
      can :read, :all
    else
      # other permissions if necessary
    end
  end
end
