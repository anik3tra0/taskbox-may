class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.date :due_date
      t.boolean :is_completed

      t.timestamps null: false
    end
  end
end
