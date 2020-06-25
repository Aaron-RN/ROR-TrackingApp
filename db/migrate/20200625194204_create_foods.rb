class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.date :date_consumed
      t.float :carbs
      t.float :fats
      t.float :protein
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
