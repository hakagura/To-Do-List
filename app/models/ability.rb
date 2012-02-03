class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'user'
      can :manage, [Project, List, Task], :user_id => user.id 
      can [:index, :show, :edit, :update,:closed_task], User, :id => user.id
    else
      can :read, User
    end
  end
end

