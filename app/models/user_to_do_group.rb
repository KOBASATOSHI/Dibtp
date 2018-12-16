class UserToDoGroup < ApplicationRecord
  belongs_to :user
  belongs_to :to_do_group
  
  scope :active, -> {where(active: true)}
  
  # 指定のユーザ、ToDoGroupの組み合わせがあれば、UserToDoGroupを返す
  # なければ、nilを返す
  def self.find_to_do_group(user, to_do_group)
    @user_to_do_groups =  UserToDoGroup.where('user_id = ? and to_do_group_id = ?', user.id, to_do_group.id)
    if @user_to_do_groups.count == 1
      return @user_to_do_groups
    else
      return nil
    end
  end
end
