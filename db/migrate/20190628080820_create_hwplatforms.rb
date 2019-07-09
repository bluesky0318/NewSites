class CreateHwplatforms < ActiveRecord::Migration[5.0]
  def change
    create_table :hwplatforms do |t|
      t.string :hwnickname
      t.string :hwcode
      t.string :hwmajorversion
      t.integer :hwminorversion
      t.integer :hworder
      t.text :hwdescription

      t.timestamps
    end
  end
end
