class CreateBugreasons < ActiveRecord::Migration[5.0]
  def change
    create_table :bugreasons do |t|
      t.string :bugdescriptionstring
      t.integer :bugorder

      t.timestamps
    end
  end
end
