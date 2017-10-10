class ExtendModel < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :points, :string
    add_column :models, :user, :string
    add_column :models, :url, :string
  end
end
