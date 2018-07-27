class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.date :deadline
      t.string :screenshot
      t.string :bug_type
      t.string :status
      t.references :project, foreign_key: true
      t.references :creater
      t.references :developer
      

      t.timestamps
    end
  end
end
