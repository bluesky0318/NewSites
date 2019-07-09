class CreateProjectfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :projectfiles do |t|

      t.belongs_to  :projectcontrol
      t.string      :prjfilename
      t.text        :prjfiledescription
      t.boolean     :prjfilevalid
      t.integer     :reporter_id
      t.integer     :categoryfile_id

      t.timestamps null: false
    end
  end
end
