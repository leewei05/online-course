# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    can :access, :rails_admin   # grant access to rails_admin
    can :read, :dashboard       # grant access to the dashboard
    
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      # {error: 'You are not Admin bro!'}
    end
  end
end
