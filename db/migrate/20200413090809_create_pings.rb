class CreatePings < ActiveRecord::Migration[6.0]
  def change
    create_table :pings do |t|
      t.datetime :time
      t.string :store

      t.timestamps
    end
  end
end
