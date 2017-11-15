class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false, default: ''
      t.integer :status, null: false, default: 1
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
