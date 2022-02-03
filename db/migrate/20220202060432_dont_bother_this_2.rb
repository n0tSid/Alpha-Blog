class DontBotherThis2 < ActiveRecord::Migration[6.0]
  def change
    drop_table :movies_categories
    create_table :movie_categories do |t|
      t.integer :movie_id
      t.integer :category_id
    end
  end
end
