class AddProfileAttributesToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :phone_number
      t.string :adress
      t.string :about_me
    end
  end
end
