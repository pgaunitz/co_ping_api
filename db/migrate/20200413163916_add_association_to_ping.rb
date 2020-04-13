class AddAssociationToPing < ActiveRecord::Migration[6.0]
  def change
    change_table :pings do |t|
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
