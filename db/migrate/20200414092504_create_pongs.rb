class CreatePongs < ActiveRecord::Migration[6.0]
  def change
    create_table :pongs do |t|
      t.string :item1
      t.string :item2
      t.string :item3
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :ping, null: false, foreign_key: true
      t.timestamps
      t.boolean :active, default: true
    end
  end
end
