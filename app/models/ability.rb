class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.admin?

      can :manage, User

    elsif user.ia_admin?

      can :manage, TestApproval
      can :manage, SystemApproval
      can :manage, LabApproval
      can :read, Network
      can :Update, Network
      can :read, Lab
      can :read, System
      can :read, Test

    elsif user.it_admin?

      can :manage, Encrypter
      can :manage, Router
      can :manage, Network
      can :read, Lab
      can :read, System
      can :read, SystemApproval
      can :read, TestApproval
      can :read, LabApproval
      can :read, Test

    elsif user.customer?
      can :create,  LabApproval
      can :read,    LabApproval
      can :create,  SystemApproval
      can :read,    SystemApproval
      can :create,  TestApproval
      can :read,    TestApproval

      can :create,  System
      can :create,  Lab

      can :create,  Test

      # Lab Access Block
      can :update, Lab do |lab|
        lab.mgr_id == user.id
      end

      can :read, Lab do |lab|
        user.lab_id == lab.id
      end

      if user.lab_id == nil
        can :create, Lab
      end

      # User Access Block
      can :manage, User do |x|
        x.id == user.id
      end

      # System Access Block
      can :update, System do |system|
        system.lab_id == user.lab_id
      end
      can :read, System do |system|
        system.lab_id == user.lab_id
      end

      # Test Access Block
      can :update, Test do |test|
        test.system.lab_id == user.lab_id
      end
      can :read, Test do |test|
        test.system.lab_id == user.lab_id
      end

    end
  end
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