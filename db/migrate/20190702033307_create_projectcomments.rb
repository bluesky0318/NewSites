class CreateProjectcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :projectcomments do |t|

      t.belongs_to  :projectcontrol
      t.text        :commentdescription
      t.integer     :reporter_id
      
      t.timestamps null: false
    end
  end
end
