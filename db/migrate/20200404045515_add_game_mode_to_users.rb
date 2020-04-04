class AddGameModeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :game_mode, :string
  end
end
