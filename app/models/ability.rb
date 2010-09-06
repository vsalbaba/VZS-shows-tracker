class Ability
  include CanCan::Ability

  def initialize(user)
    can :feed, Show
    if user.admin?
      can :subscribe_others, Show
      can :manage, :all
      cannot :delete, Show
    elsif user.superadmin?
      can :manage, :all
      can :subscribe_others, Show
    else
      cannot :kick, Show
      cannot :unarchive, Show
      cannot :archive, Show
      cannot :subscribe_others, Show
    end
  end
end

