class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string   :description
      t.decimal  :price, scale: 8, percision: 2
      t.integer  :merchant_id
      t.timestamps
    end
  end
end