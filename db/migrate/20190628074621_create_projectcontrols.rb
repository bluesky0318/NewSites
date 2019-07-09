class CreateProjectcontrols < ActiveRecord::Migration[5.0]
  def change
    create_table :projectcontrols do |t|
      t.string    :projectname,       null: false
      t.string    :projectcode,       null: false, unique: true
      t.text      :prjdescription,    null: false
      t.string    :cclist

      t.timestamps
    end
  end
end


