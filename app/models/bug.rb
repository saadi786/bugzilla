class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :creater_id, class_name: 'user'
  belongs_to :developer_id, class_name: 'user'

end
