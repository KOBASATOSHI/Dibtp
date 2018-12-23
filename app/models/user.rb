class User < ApplicationRecord
  has_many :user_to_do_groups
  has_many :to_do_groups, through: :user_to_do_groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :rememberable, :trackable, :registerable, omniauth_providers: [:twitter]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
  
  # user_to_do_groupがなければ、追加、あればアクティブにする
  def register_user_to_do_group(to_do_group)
    @user_to_do_group = UserToDoGroup.find_to_do_group(self, to_do_group)
    if @user_to_do_group.nil?
      UserToDoGroup.create(user_id: self.id, to_do_group_id: to_do_group.id, active: true)
    else
      @user_to_do_group.update(active: true)
    end
  end
  
  #一つでもactiveなUserToDoGroupがある場合true
  def have_active_user_to_do_group?
    return self.user_to_do_groups.active.count != 0
  end
  
  def current_active_to_do_group
    @user_to_do_group = self.user_to_do_groups.active
    if @user_to_do_group.count == 1
      return @user_to_do_group[0].to_do_group
    else
      return nil
    end
  end
end