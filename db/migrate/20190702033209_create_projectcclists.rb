class CreateProjectcclists < ActiveRecord::Migration[5.0]
  def change
    create_table :projectcclists do |t|

      t.belongs_to  :projectcontrol
      t.integer     :user_id

      t.timestamps null: false
    end
  end
end
