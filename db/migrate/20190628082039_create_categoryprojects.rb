class CreateCategoryprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :categoryprojects do |t|
      t.string :categoryprojectstring
      t.integer :categoryprojectorder

      t.timestamps
    end
  end
end
