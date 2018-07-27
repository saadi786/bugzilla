class RenameUsersProjectsToUserProject < ActiveRecord::Migration[5.2]
  def change
    rename_table :users_projects, :user_projects
  end
end
