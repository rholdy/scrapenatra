class ExtendModel < ActiveRecord::Migration
  def change
    add_column :models, :points, :string
    add_column :models, :user, :string
    add_column :models, :url, :string
  end
end
