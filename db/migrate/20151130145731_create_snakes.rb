class CreateSnakes < ActiveRecord::Migration
  def change
    create_table :snakes do |t|
      t.string :name, null: false
      t.string :species, null: false

      t.timestamps null: false
    end
  end
end
