class RemoveColumnGenreMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :genre, :text
    add_column :movies, :description, :text
    drop_table :students
  end
end
