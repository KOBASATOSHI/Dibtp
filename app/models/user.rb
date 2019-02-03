class User < ApplicationRecord
  has_many :user_to_do_groups	
  has_many :to_do_groups, through: :user_to_do_groups	
  has_many :to_dos
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :omniauthable, omniauth_providers: [:twitter]

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
  # 登録されたToDoグループの一つ目を作成する
  def register_user_to_do_group(to_do_group)
    @user_to_do_group = UserToDoGroup.find_to_do_group(self, to_do_group)
    if @user_to_do_group.nil?
      UserToDoGroup.create(user_id: self.id, to_do_group_id: to_do_group.id, active: true, start_count: 1)
    else
      @start_count = @user_to_do_group[0].start_count
      @user_to_do_group.update(active: true, start_count: @start_count + 1)
    end
    @to_do_master = to_do_group.to_do_masters.order(:order_number).limit(1)
    @to_do_master[0].create_to_do(self, 1, Date.today)
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
  
  def close_all
    @to_dos = self.to_dos.on_going
    @to_dos.each do |t|
      t.update(done: true)
    end
  end
  
  private
  
    # # メールアドレスをすべて小文字にする
    # def downcase_email
    #   self.email.downcase!
    # end
end
