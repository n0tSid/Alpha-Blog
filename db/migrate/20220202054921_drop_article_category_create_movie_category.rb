class DropArticleCategoryCreateMovieCategory < ActiveRecord::Migration[6.0]
  def change
    drop_table :articles_categories
  end

  def change
    create_table :movies_categories do |t|
      t.integer :movie_id
      t.integer :category_id
    end
  end
end
