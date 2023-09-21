class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Si el usuario no está autenticado

    can :read, Group
    can :manage, Group, user_id: user.id
    
    can :read, Label
    can :manage, Label, user_id: user.id
    
    can :read, Payment
    can :manage, Payment, group: { user_id: user.id }

    can :manage, :all 
  end
end
