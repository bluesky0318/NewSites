class CreateStatussolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :statussolutions do |t|

      t.belongs_to  :status
      t.text        :solutionstring
      t.integer     :solutionorder
      
      t.timestamps null: false
    end
  end
end
