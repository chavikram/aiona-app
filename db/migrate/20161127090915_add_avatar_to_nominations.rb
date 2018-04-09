class AddAvatarToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :avatar, :string
  end
end
