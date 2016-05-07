class AddavatartoUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :cover, :string
  end
end
