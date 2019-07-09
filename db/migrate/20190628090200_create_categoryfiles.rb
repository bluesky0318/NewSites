class CreateCategoryfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :categoryfiles do |t|
      t.string :categoryfilestring
      t.integer :categoryfileorder

      t.timestamps
    end
  end
end
