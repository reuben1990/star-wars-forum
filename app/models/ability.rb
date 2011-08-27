class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :manage, :all if user.admin?
    
    can :read, Category, :state => true
    can :read, Forum, :state => true, :category => { :state => true }
    can :read, Topic, :forum => { :state => true, :category => { :state => true } }
    can :read, Post, :topic => { :forum => { :state => true, :category => { :state => true } } }
    
    can :update, Post, :user_id => user.id, :topic => { :locked => false }
    can :destroy, [Topic,Post], :user_id => user.id, :topic => { :locked => false }
    
    can :create, Post, :topic => { :locked => false } unless user.new_record?
    can :create, Topic unless user.new_record?
  end
end
