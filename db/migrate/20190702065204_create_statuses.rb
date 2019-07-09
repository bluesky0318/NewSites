class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|

      t.string  :statusstring
      t.integer :statusorder
      t.boolean :statusproject
      t.boolean :statusissue
      t.boolean :statusrelease
      
      t.timestamps null: false
    end
  end
end