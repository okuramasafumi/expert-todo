class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false, default: ''
      t.integer :status, null: false, default: 1
      t.string :description, null: false, default: ''
      t.datetime :due_date

      t.timestamps
    end
  end
end
