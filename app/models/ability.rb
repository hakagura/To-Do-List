class Ability # Class com as definicoes das barreiras do cancan
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin' # se usuario administrador pode modificiar tudo
      can :manage, :all
    elsif user.role == 'user'
      can :manage, [Project, List, Task], :user_id => user.id # modifica somente se for o usuario de criacao
      can [:index, :show, :edit, :update], User, :id => user.id # modifica somente se for o usuario de criacao
    else
      can :read, User
    end
  end
end

