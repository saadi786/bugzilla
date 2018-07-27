class UserProject < ApplicationRecord
	belongs_to :user
	belongs_to :project

	validates :user_type, presence: true
end
