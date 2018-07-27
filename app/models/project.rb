class Project < ApplicationRecord
	has_many :user_projects
	has_many :users, through: :user_projects
	has_many :bugs
     
	accepts_nested_attributes_for :user_projects
    scope :project_sort, -> {where('id >=?',1)}
end
