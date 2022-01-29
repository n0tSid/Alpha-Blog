class Player < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :playername
      t.integer :age

      t.timestamps
    end
  end
end
