class AddSkinsTable < ActiveRecord::Migration
  def change
    create_table :skins do |t|
      t.belongs_to :snake, null: false
      t.timestamps null: false
    end
  end
end
