class CreateStoreSettings < ActiveRecord::Migration
  def change
    create_table :store_settings do |t|
      t.string :name
      t.string :store_name

      t.timestamps null: false
    end
  end
end
