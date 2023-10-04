class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Define abilities for different roles
    if user.admin?
      can :manage, :all # Admins can manage all resources
    else
      can :read, :all
      can :destroy, Post, author_id: user.id
      can :destroy, Comment, user_id: user.id

    end
  end
end
