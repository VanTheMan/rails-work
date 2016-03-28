class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :slogan
      t.text :description
      t.integer :stars
      t.float :price

      t.timestamps null: false
    end
  end
end
