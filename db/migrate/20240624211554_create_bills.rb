class CreateBills < ActiveRecord::Migration[7.1]
  def change
    create_table :bills do |t|
      t.references :event, null: false, foreign_key: true
      t.float :total_amount
      t.integer :total_items
      t.string :charge_method
      t.float :total_peruser

      t.timestamps
    end
  end
end
