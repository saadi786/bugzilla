class User < ApplicationRecord
	has_many :user_projects
	has_many :projects, through: :user_projects
	#has_many :bugs
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         User_var= ['developer','manager','qa']
end
