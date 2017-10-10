class CreateModel < ActiveRecord::Migration[5.1]
  def up
    create_table :models do |t|
      t.string :name
    end
  end

  def down
    drop_table :models
  end
end
