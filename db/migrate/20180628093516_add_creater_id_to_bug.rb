class AddCreaterIdToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :creater_id, :integer
  end
end
