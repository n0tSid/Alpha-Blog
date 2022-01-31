class DeleteAgeColumnFromPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :age
  end
end
