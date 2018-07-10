class Project < ApplicationRecord
	has_many :user_projects
	has_many :users, through: :user_projects
	has_many :bugs
     
	accepts_nested_attributes_for :user_projects
	accepts_nested_attributes_for :users

    validates :name, :presence => true

end
