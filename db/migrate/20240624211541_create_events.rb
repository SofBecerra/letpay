class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :total_user
      t.boolean :active, default:true
      t.string :link

      t.timestamps
    end
  end
end
