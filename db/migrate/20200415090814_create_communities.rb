class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string :code
      t.string :name

      t.timestamps
    end

    change_table :users do |t|
      t.belongs_to :community, null: false, foreign_key: true, default: 1
      t.integer :community_status, default: 0
    end
  end
end
