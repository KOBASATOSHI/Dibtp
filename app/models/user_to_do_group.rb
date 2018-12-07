class UserToDoGroup < ApplicationRecord
  belongs_to :user
  belongs_to :to_do_group
end
