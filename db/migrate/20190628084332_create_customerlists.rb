class CreateCustomerlists < ActiveRecord::Migration[5.0]
  def change
    create_table :customerlists do |t|
      t.string :companyname
      t.string :engineeremail
      t.integer :customerorder
      t.text :companydescription

      t.timestamps
    end
  end
end
