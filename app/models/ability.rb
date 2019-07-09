class Ability
  include CanCan::Ability

  def initialize(user)
    if user.blank?
      # not logged in
      cannot :manage, :all
      #basic_read_only
    #elsif user.has_role?(:poweradmin)
    elsif user.role == "poweradmin"
      # power admin
      can :manage, :all
    #elsif user.has_role?(:admin)
    elsif user.role == "admin"
      # admin
      user_basic
      member_operate
      admin_manage
      #can :create, Projectcontrol
      #can :update, Projectcontrol # do |topic|
        #(topic.user_id == user.id)
      #end
      
      #can :destroy, Projectcontrol #do |topic|
         #(topic.user_id == user.id)
      #end
      
      #basic_read_only
    #elsif user.has_role?(:member)
    elsif user.role == "member"
      # member
      user_basic
      member_operate
    #elsif user.has_role?(:user)
    elsif user.role == "user"
      # user
      user_basic
    else
      # banned or unknown situation
      cannot :manage, :all
      #basic_read_only
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end

#:manage: 是指這個 controller 內所有的 action
#:read :  指 :index 和 :show
#:update: 指 :edit  和 :update
#:destroy:指 :destroy
#:delete: 指 :delete
#:create: 指 :new   和 :crate

protected
  
  def user_basic
    can :read,    [Issueboard, Releasecenter]
    can :update,  [User]
  end
  def member_operate
    can :update,  [Issueboard, User]
    can :read,    [Issueboard, Releasecenter]
    can :create,  [Issueboard]
  end
  def admin_manage
    can :manage,  [Projectfile, Projectcclist, Projectcomment, Issueboard, Releasecenter]
    can :read,    [Projectcontrol, Downloadcetre]#, Logbackground, Logcolumnitem]
    can :update,  [Projectcontrol, User]#, Logbackground, Logcolumnitem]
    can :create,  [User]
    #can :delete,  [Logbackground, Logcolumnitem]
  end
end

