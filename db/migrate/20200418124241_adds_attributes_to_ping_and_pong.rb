class AddsAttributesToPingAndPong < ActiveRecord::Migration[6.0]
  def change
    change_table :pongs do |t|
      t.string :total_cost
    end

    change_table :pings do |t|
      t.boolean :completed, default: false
    end
  end
end
