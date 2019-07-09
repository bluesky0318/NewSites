class CreateOsplatforms < ActiveRecord::Migration[5.0]
  def change
    create_table :osplatforms do |t|
      t.references :categoryproject, foreign_key: true
      t.string :osdescribe
      t.integer :osorder

      t.timestamps
    end
  end
end
