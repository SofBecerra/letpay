class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
