class UsersProject < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :project
end
