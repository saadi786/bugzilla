class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :creater, class_name: 'User'
  belongs_to :developer, class_name: 'User',optional: true
  mount_uploader :screenshot, ScreenshotUploader

  TYPE= ['feature','BUG']
  BUG_STATUS= ['new','started','completed']

    validates :title, :bug_type, :status, presence: true
    validates :title, uniqueness: true

   

end
