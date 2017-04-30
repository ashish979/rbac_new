class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(user)
      user||= User.new
      if user.super_admin?
        can :manage, :all
        return
      end
      user.permissions.each do |permission|
        subject_class = permission.subject_class.classify.constantize rescue NilClass
        if permission.subject_id.nil?
          can permission.action.to_sym, subject_class
        else
          can permission.action.to_sym, subject_class, :id => permission.subject_id
        end
      end
    end
  end
end
