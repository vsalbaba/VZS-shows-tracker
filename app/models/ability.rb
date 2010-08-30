class Ability
  include CanCan::Ability

  def initialize(user)
    can :feed, Show
    if user.admin?
      can :manage, :all
      cannot :delete, Show
    elsif user.superadmin?
      can :manage, :all
    else
      cannot :kick, Show
      cannot :unarchive, Show
      cannot :archive, Show
    end
  end
end

